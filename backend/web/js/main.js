function showParent(parent) {
    $('#parents-modal .modal-body').html(parent);
    $('#parents-modal').modal();
}

$('.add-to-family').on('click', function (e) {

    e.preventDefault();
    var id = $(this).data('id');

    $.ajax({
        url: '/admin/parent/default/add-family',
        data: {id: id},
        type: 'GET',
        success: function (res) {
            if (!res)  alert('Ошибка!');
          //  console.log(res);
            showParent(res);
        },
        error: function () {
            alert('Error!');
        }
    });
});
