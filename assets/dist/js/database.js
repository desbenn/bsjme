$(document).ready(function() {

    $('#file_browser').click(function(e){
    e.preventDefault();
    $('#file').click();
    });

    $('#file').change(function(){
        $('#file_path').val($(this).val());
    });

    $('#file_path').click(function(){
        $('#file_browser').click();
    });
  

});

function add_sql(database)
{
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').remove(); // clear error string
    $('#upload_main_sql_modal').modal('show');

    if (database == 'mine') {
        upload_for = 'mine';
        $('.modal-title').text('Upload mine sql'); // Set Title to Bootstrap modal title
    }
}

function upload_sql()
{
    var formData = new FormData($('#upload_sql_form')[0]);
    //form_data.set('logo', file_data);
    $.ajax({
        url: base_url+'main/database/upload_sql/'+upload_for,
        dataType: "JSON",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {

            if(data.status) //if success close modal and reload ajax table
            {
                var n = noty({
                    text: 'Sql successfully uploaded!',
                    theme: 'metroui',
                    type: 'success',
                    layout: 'bottomLeft',
                    dismissQueue: true,
                    callback: {
                        afterShow: function(){
                            setTimeout(function(){
                                n.close();
                            },1000);
                            location.reload();
                        }
                    }
                });
            }


        }, 
        error: function () {
        //if there is an error append a 'none available' option

        }
    });
}