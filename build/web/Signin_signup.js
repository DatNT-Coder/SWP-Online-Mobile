const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () =>
    container.classList.add('right-panel-active'));

signInButton.addEventListener('click', () =>
    container.classList.remove('right-panel-active'));

document.addEventListener("DOMContentLoaded", () => {
    // Select all toggle icons
    const toggleIcons = document.querySelectorAll('[data-toggle="password"]');

    toggleIcons.forEach(icon => {
        // Add click event listener to each icon
        icon.addEventListener('click', () => {
            // Find the associated input using a data attribute
            const inputId = icon.getAttribute('data-target');
            const passwordField = document.getElementById(inputId);

            if (passwordField) {
                // Toggle the input type and icon class
                const isPassword = passwordField.type === 'password';
                passwordField.type = isPassword ? 'text' : 'password';

                // Toggle the icon's class
                icon.classList.toggle('bxs-show', !isPassword);
                icon.classList.toggle('bxs-hide', isPassword);
            }
        });
    });
});
