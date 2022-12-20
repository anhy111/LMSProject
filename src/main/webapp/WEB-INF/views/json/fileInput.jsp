<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<html>
  <form id="file-form">
    <input type="file" id="file-input" />
    <button type="submit">Submit</button>
  </form>

  <script>
    $(function() {

      let header = "${_csrf.headerName}";
      let token = "${_csrf.token}";

      $('#file-form').submit(function(e) {
        e.preventDefault();
        var formData = new FormData();
        formData.append('file', $('#file-input')[0].files[0]);

        $.ajax({
          url: '/upload',
          type: 'POST',
          data: formData,
          beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
          },
          success: function (data) {
            console.log('file uploaded successfully');
          },
          error: function (data) {
            console.log('There was an error uploading the file');
          },
          cache: false,
          contentType: false,
          processData: false
        });
      });
    });

  </script>
</html>