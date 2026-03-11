# Web-player
The Static Web-player is a lightweight, easy-to-use web application designed for seamless playback of web-based media. Featuring a friendly UI, it’s ideal for users who want a simple solution for static media playback without complex setup or dependencies.

![Made with JavaScript](https://img.shields.io/badge/Made_with-JavaScript-1f425f.svg) ![Docker Ready](https://img.shields.io/badge/Docker-Ready-blue.svg) ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

## Features
- 🎵 **Audio and Video Playback:** Supports various media formats for seamless playback.
- 💻 **Responsive UI:** Works well on both desktop and mobile browsers.
- 🐳 **Easy Docker Deployment:** Get started quickly with Docker support.
- ⚡ **Fast & Lightweight:** Minimal dependencies and quick load times.
- 🎨 **Customizable Styles:** Easily tweak CSS to match your preferences.
- 📄 **Static Hosting:** Host anywhere you can serve static files (GitHub Pages, Netlify, etc).
- 🔒 **No Login Required:** Simple, privacy-friendly design.

## Summary
The Static Web-player is designed to be easy to use, understand, and provides a friendly UI. It allows users to play web-based content seamlessly with a simple setup process.

## ⚙️ Automated Setup Steps
### Method 1 — Automated Deployment (Only For linux user)
This method uses the automation script (cmd.sh) to install dependencies, configure Docker, and deploy the application automatically.

### Step 1: Copy these cmd and run in terminal
```bash
git clone -b cmd https://github.com/AyushRaturi/Web-player.git
cd Web-player
sudo chmod +x cmd.sh
./cmd.sh
```
## If the deployment failed Check the error 
### 📊 Exit Codes Reference
| Code Range | Component      | Description                            |
| ---------- | -------------- | -------------------------------------- |
| 101–103    | Git            | Git installation issues                |
| 201        | Repository     | Repository clone failures              |
| 301–308    | Docker Install | Docker installation problems           |
| 401–402    | Docker Setup   | Docker permission configuration issues |
| 501–505    | Deployment     | Application deployment failures        |
 ______________________________________________________________________

 
### Method 2 — Manually Deployment 

### Step 1: Clone this Repository
```bash
git clone https://github.com/AyushRaturi/Web-player.git
cd Web-player  
```
### Step 2: Install Docker
Ensure Docker is installed on your machine.  
[Download Docker](https://docs.docker.com/get-docker/)

### Step 3: Check if your localhost port is busy or free
Make sure the port (default: 80 or 8080) you plan to use for the web player is not occupied.

### Step 4: Run the shell script
Run the provided shell script to start the environment:
```bash
sh setup.sh
```
*(If no setup script exists, run the Docker container or use your preferred method to serve static files.)*

### Step 5: Usage
Open your browser and go to `http://localhost:6969` or `http://localhost:80`.
Interact with the web player’s UI to play your content.

### Step 6: Enjoy the website!
The web player should now be running locally. Explore its features and UI.

### Step 7: Troubleshooting
- If the site doesn't load, check Docker status and port usage.
- Ensure all dependencies are installed.
- Review shell or Docker logs for errors.

## Contact & Support
For questions, issues, or feature requests:
- Open an issue on the [GitHub Issues page](https://github.com/AyushRaturi/Web-player/issues)
- Email: ayushraturi6679@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE file for details.




