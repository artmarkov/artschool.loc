function showParent(parent) {
    $('#parents-modal .modal-body').html(parent);
    $('#parents-modal').modal();
}

$('.add-to-family').on('click', function (e) {

    e.preventDefault();
    
    var id = $(this).data('id'),
        user_slave_id = $('#student-user_slave_id').val();

    $.ajax({
        url: '/admin/parent/default/init-family',
        data: {id: id, user_slave_id: user_slave_id},
        type: 'GET',
        success: function (res) {
            if (!res)  alert('Error!');
          //  console.log(res);
            showParent(res);
        },
        error: function () {
            alert('Error!');
        }
    });
});
