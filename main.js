let songs = [
    {
        src: "assets/blue.mp3",
        name: "Blue",
        artist: "Yung Kai",
        albumImage: "assets/blue.jpg",
        liked: true
    },
    {
        src: "assets/moonlight.mp4",
        name: "Moonlight",
        artist: "Kali Uchis",
        albumImage: "assets/Kali Uchis - Moonlight .jpeg",
        liked: false
    },
    {
        src: "assets/Timeless.mp3",
        type: "audio/mpeg",
        name: "Timeless",
        artist: "Weekend",
        albumImage: "assets/Timeless.jpeg",
        liked: false
    }
];

let currentSongIndex = 0;
let repeatMode = 0;
const audioPlayer = document.getElementById('audio-player');
const playPauseBtn = document.getElementById('play-pause-btn');
const albumCover = document.getElementById('album-cover');
const songTitle = document.getElementById('title');
const artistName = document.getElementById('artist');
const durationBar = document.getElementById('durationbar');
const volumebar = document.getElementById('volumebar');
const currentTimeDisplay = document.getElementById('current-time');
const durationDisplay = document.getElementById('duration-time');
const repeatbtn = document.getElementById('repeatbtn');
    
   

// Load the first song on page load
function loadSong(index) {
    currentSongIndex = index;
    audioPlayer.src = songs[index].src;
    albumCover.src = songs[index].albumImage;
    songTitle.textContent = songs[index].name;
    artistName.textContent = songs[index].artist;
    audioPlayer.load();
    updatePlayPauseIcon();
}

// Play/Pause toggle
function togglePlayPause() {
    if (audioPlayer.paused) {
        audioPlayer.play();
    } else {
        audioPlayer.pause();
    }
    updatePlayPauseIcon();
}

// Update play/pause button icon
function updatePlayPauseIcon() {
    playPauseBtn.innerHTML = audioPlayer.paused
        ? '<i class="fa-solid fa-play"></i>'
        : '<i class="fa-solid fa-pause"></i>';
}

// Previous song
function prevSong() {
    currentSongIndex = (currentSongIndex - 1 + songs.length) % songs.length;
    loadSong(currentSongIndex);
    audioPlayer.play();
}

// Next song
function nextSong() {
    currentSongIndex = (currentSongIndex + 1) % songs.length;
    loadSong(currentSongIndex);
    audioPlayer.play();
}


// Play random song
function playRandomSong() {
    const randomIndex = Math.floor(Math.random() * songs.length);
    loadSong(randomIndex);
    audioPlayer.play();
}

// repeat song 
let isLoopingOnce = false;

repeatbtn.addEventListener('click', () => {
    if (isLoopingOnce) {
        // Reset to default repeat (no loop)
        repeatbtn.innerHTML = '<i class="fa-solid fa-repeat"></i>';
        audioPlayer.loop = false; // Disable continuous looping
        isLoopingOnce = false;
    } else {
        // Change to repeat once
        repeatbtn.innerHTML = '<i class="fa-solid fa-repeat"></i>';
        audioPlayer.loop = false; // Ensure continuous looping is off
        isLoopingOnce = true;
    }
});



// Automatically play next song when the current one ends
audioPlayer.onended = nextSong;

// Update progress bar and time while playing
audioPlayer.ontimeupdate = function () {
    if (audioPlayer.duration) {
        let progressPercentage = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        durationBar.value = progressPercentage;
        currentTimeDisplay.textContent = formatTime(audioPlayer.currentTime);
        durationDisplay.textContent = formatTime(audioPlayer.duration);
    }
};

// Ensure duration updates when song loads
audioPlayer.onloadedmetadata = function () {
    durationDisplay.textContent = formatTime(audioPlayer.duration);
};

// Seek song position manually
durationBar.addEventListener("input", function () {
    let seekTime = (durationBar.value / 100) * audioPlayer.duration;
    audioPlayer.currentTime = seekTime;
});

// Format time for display (MM:SS)
function formatTime(seconds) {
    let minutes = Math.floor(seconds / 60);
    let secs = Math.floor(seconds % 60);
    return `${minutes}:${secs < 10 ? '0' : ''}${secs}`;
}


// Load the first song and play automatically when the page opens
document.addEventListener("DOMContentLoaded", function() {
    loadSong(currentSongIndex);
    audioPlayer.play();
});


// Volume controller 
function setVolume(myVolume) {
    audioPlayer.volume = volumebar.value / 100;
}

// Set default volume to 50%
audioPlayer.volume = 0.5;
volumebar.value = 50;