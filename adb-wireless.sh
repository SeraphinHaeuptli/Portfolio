#!/bin/bash
# A script to manage modern ADB wireless connections (Android 11+).

# --- Get Script's own directory ---
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")


# --- Configuration ---
# Set your default IP address prefix.
# With "192.168.", you can enter a suffix like "2.82".
# Find your phone's IP in Settings > Wi-Fi > (Your Network) or in Wireless Debugging.
DEFAULT_IP_PREFIX="192.168."

# --- Functions ---

# Function to get and resolve the IP address from user input
get_ip_address() {
    echo ""
    echo "Enter the device's full IP address OR the last two parts (e.g., 2.82)."
    read -p "IP address or suffix: " ip_input

    # Exit if input is empty
    if [ -z "$ip_input" ]; then
        echo "Error: IP address cannot be empty. Aborting."
        exit 1
    fi

    # Count the number of dots in the input to determine if it's a full IP
    dot_count=$(echo "$ip_input" | grep -o "\." | wc -l)

    # A full IP address (e.g., 192.168.2.82) has 3 dots.
    if [ "$dot_count" -eq 3 ]; then
        # Use the input directly as it's a full IP
        DEVICE_IP=$ip_input
    else
        # Otherwise, assume it's a suffix and prepend the default prefix
        DEVICE_IP="${DEFAULT_IP_PREFIX}${ip_input}"
    fi
    echo "--> Using device IP: $DEVICE_IP"
}

# --- Main Script ---

echo "--- ADB Wireless Helper (for Android 11+) ---"

# 0. Check for adb
if ! command -v adb &> /dev/null; then
    echo "Error: 'adb' command not found. Please install it and ensure it's in your PATH."
    exit 1
fi

echo "Ensure 'Wireless debugging' is enabled in Developer Options on your device."
echo ""

# Ask the user for the desired action
read -p "Do you want to [p]air a new device or [c]onnect to a paired one? " action

if [[ "$action" == "p" || "$action" == "P" ]]; then
    # --- PAIRING LOGIC ---
    echo ""
    echo "--- Mode: Pairing New Device ---"
    echo "1. On your phone, go to 'Wireless debugging' and tap 'Pair device with pairing code'."
    echo "2. You will see an IP address, a Port, and a Pairing Code."
    
    get_ip_address

    read -p "Enter the 5-digit PORT shown on the pairing screen: " pair_port
    read -p "Enter the 6-digit Wi-Fi pairing code: " pair_code

    if [ -z "$pair_port" ] || [ -z "$pair_code" ]; then
        echo "Error: Both Port and Pairing Code are required. Aborting."
        exit 1
    fi

    echo ""
    echo "--> Attempting to pair with $DEVICE_IP:$pair_port..."
    adb pair "$DEVICE_IP:$pair_port" "$pair_code"

elif [[ "$action" == "c" || "$action" == "C" ]]; then
    # --- CONNECTING LOGIC ---
    echo ""
    echo "--- Mode: Connecting to Device ---"
    echo "--> Clearing any stale connections first..."
    adb disconnect
    sleep 1

    echo "1. On your phone, go to the main 'Wireless debugging' screen."
    echo "2. Look for the 'IP address & Port' (e.g., 192.168.1.43:37101)."

    get_ip_address

    read -p "Enter the 5-digit PORT shown under 'IP address & Port': " connect_port

    if [ -z "$connect_port" ]; then
        echo "Error: Port is required. Aborting."
        exit 1
    fi

    echo ""
    echo "--> Attempting to connect to $DEVICE_IP:$connect_port..."
    adb connect "$DEVICE_IP:$connect_port"

else
    echo "Invalid option. Please run the script again and choose 'p' or 'c'."
    exit 1
fi

echo ""
echo "--- Verifying Connection ---"
echo "Listing all adb devices:"
adb devices
echo ""

# Check if a device is actually connected before proceeding
if adb devices | grep -q "device$"; then
    echo "✅ Connection successful."
    read -p "Launch [s]crcpy (video), s[n]dcpy (audio), [b]oth, or [q]uit? " launch_choice

    # The serial number for the wireless device is its IP and port
    DEVICE_SERIAL="${DEVICE_IP}:${connect_port}"

    # Change to the script's own directory to ensure sndcpy can find its files.
    cd "$SCRIPT_DIR" || exit

    case $launch_choice in
        s|S)
            echo "--> Launching scrcpy for ${DEVICE_SERIAL}..."
            scrcpy -s "${DEVICE_SERIAL}"
            ;;
        n|N)
            echo "--> Launching sndcpy for ${DEVICE_SERIAL}..."
            ./sndcpy "${DEVICE_SERIAL}"
            ;;
        b|B)
            echo "--> Launching both for ${DEVICE_SERIAL}..."
            # Launch sndcpy in the background, then scrcpy in the foreground
            ./sndcpy "${DEVICE_SERIAL}" &
            sleep 2
            scrcpy -s "${DEVICE_SERIAL}"
            ;;
        q|Q|*)
            echo "--> Done. You can now run adb commands manually."
            ;;
    esac
else
    echo "❌ Connection failed. Please check the IP/Port and try again."
fi