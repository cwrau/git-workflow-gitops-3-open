const greeting = document.getElementById("greeting");
const hour = new Date().getHours();

if (hour < 12) {
  greeting.textContent = "Guten Morgen! Willkommen auf der Team-Seite.";
} else if (hour < 18) {
  greeting.textContent = "Guten Tag! Willkommen auf der Team-Seite.";
} else {
  greeting.textContent = "Guten Abend! Willkommen auf der Team-Seite.";
}
