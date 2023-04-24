// Get the competence list
const competences = document.querySelectorAll('.competences li');

// Set a random background color for each competence
competences.forEach((competence) => {
  competence.style.backgroundColor = getRandomColor();
});

// Show the competences one by one
let index = 0;
function showCompetences() {
  if (index < competences.length) {
    competences[index].classList.add('visible');
    index++;
    setTimeout(showCompetences, 500);
  }
}
showCompetences();

// Generate a random color in hexadecimal format
function getRandomColor() {
  const letters = '0123456789ABCDEF';
  let color = '#';
  for (let i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}
