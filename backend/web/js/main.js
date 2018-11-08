function showParent(parent) {
    $('#parents-modal .modal-body').html(parent);
    $('#parents-modal').modal();
}

$('.add-to-family').on('click', function (e) {

    e.preventDefault();
    
    var id = $(this).data('id'),
        user_slave_id = $('#student-family_list').val();

    $.ajax({
        url: '/admin/parent/default/add-family',
        data: {id: id, user_slave_id: user_slave_id},
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
