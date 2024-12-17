# Raspberry Pi Surveillance Camera System

This project sets up a simple surveillance camera system on a Raspberry Pi. It streams live video from the camera to a webpage that you can access locally or remotely.

---

## **Features**
- **Live Streaming**: Stream video from a Raspberry Pi Camera Module or USB Webcam.
- **Webpage Access**: View the camera feed in a browser using a simple HTML page.
- **Remote Access**: Access the camera feed over the internet using port forwarding.
- **Motion Detection** (Optional): Configure motion detection to save recordings.

---

## **Prerequisites**
- **Hardware**:
  - Raspberry Pi (any model with camera support).
  - Raspberry Pi Camera Module or USB Webcam.
- **Software**:
  - Raspberry Pi OS (Raspbian).
  - `motion` for video streaming.
  - Python3 for serving the webpage.

---

## **Setup Instructions**

### **1. Connect and Enable the Camera**
1. Connect the **Raspberry Pi Camera Module** to the camera port using the ribbon cable.
2. Enable the camera interface:
   ```bash
   sudo raspi-config
   ```
   Navigate to **Interfacing Options > Camera**, and enable it. Reboot the Raspberry Pi:
   ```bash
   sudo reboot
   ```

---

### **2. Install Required Software**
Update your system and install the necessary tools:
```bash
sudo apt update
sudo apt upgrade
sudo apt install libcamera-apps ffmpeg motion python3
```

---

### **3. Configure Motion for Streaming**
1. Edit the **Motion configuration file**:
   ```bash
   sudo nano /etc/motion/motion.conf
   ```
2. Update the following settings:
   ```text
   daemon on                # Run Motion as a daemon
   stream_localhost off     # Allow external access to the stream
   stream_port 8081         # Port for the video stream
   width 640                # Stream resolution width
   height 480               # Stream resolution height
   ```
3. Save the file (`Ctrl+O` and `Ctrl+X`).

4. **Start Motion**:
   ```bash
   sudo motion
   ```
   By default, the live video feed will be available at:
   ```
   http://<raspberry_pi_ip>:8081
   ```

   Replace `<raspberry_pi_ip>` with your Raspberry Pi's IP address. You can find your IP using:
   ```bash
   hostname -I
   ```

---

### **4. Serve the Webpage**
1. Create an HTML file to display the camera feed:
   ```bash
   nano ~/camera_stream.html
   ```
2. Add the following code:
   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Raspberry Pi Camera Stream</title>
   </head>
   <body>
       <h1>Raspberry Pi Camera Stream</h1>
       <img src="http://<raspberry_pi_ip>:8081" alt="Live Camera Stream" style="width: 640px; height: 480px;">
   </body>
   </html>
   ```
   Replace `<raspberry_pi_ip>` with your Raspberry Pi's IP address.

3. Save and exit the file.

4. Start an **HTTP server** to serve the webpage:
   ```bash
   python3 -m http.server 8000
   ```

5. Access the webpage in a browser:
   ```
   http://<raspberry_pi_ip>:8000
   ```

---

## **5. Remote Access (Optional)**
To access the camera feed from outside your local network:
1. **Set up Port Forwarding**:
   - Log in to your router's configuration page.
   - Forward ports `8000` (webpage) and `8081` (video stream) to your Raspberry Pi's IP address.

2. **Dynamic DNS**:
   - Use a service like **No-IP** to map your public IP to a domain name.

---

## **6. Optional Enhancements**
1. **Secure the Stream**:
   - Use **Nginx** or **Apache** to enable HTTPS and password protection.
2. **Enable Motion Detection**:
   - Configure the `motion.conf` file to enable saving videos/images when motion is detected.
3. **Cloud Integration**:
   - Use tools like **Dropbox-Uploader** or **Google Drive API** to upload recordings to the cloud.

---

## **Troubleshooting**
- **Stream Not Loading**: Ensure Motion is running and the correct IP address/port is used.
- **Permission Denied**: Check file permissions or run commands with `sudo`.
- **Network Issues**: Verify the Raspberry Pi is connected to the network.

---

## **Access Links**
- **Live Camera Feed**:  
  ```
  http://<raspberry_pi_ip>:8081
  ```
- **Webpage**:  
  ```
  http://<raspberry_pi_ip>:8000
  ```

Replace `<raspberry_pi_ip>` with your Raspberry Pi's IP address.