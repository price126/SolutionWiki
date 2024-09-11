const modal = document.querySelector('.modal');
const btnOpenModal = document.getElementById('log_in');

btnOpenModal.addEventListener("click", () => {
    modal.style.display = "flex";
});
btnLogin.addEventListener("click", () => {
    closeModal();

    const modalClose = document.querySelector('.modal_close');
    modalClose.addEventListener("click", () => {
        closeModal();
    });
    function closeModal() {
        modal.style.display = "none";
    }

});