<?php
    $link = new mysqli('localhost', 'root');
    $mysql_version = $link->server_info ? $link->server_info : 'Unable to connect to local MySQL Server!';
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- These 3 meta tags *must* come first in the head; any other head content
         must come *after* these tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Klenwell Docker LAMP</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet"
          href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="icon" href="/favicon.ico" />

    <style>
        h1 {
            text-align: center;
        }
    </style>
  </head>

  <body>
    <h1>Klenwell Docker LAMP</h1>

    <div class="container content">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <dl class="dl-horizontal">
                    <dt>PHP</dt>
                    <dd><?php echo phpversion(); ?></dd>

                    <dt>MySQL</dt>
                    <dd><?php echo $mysql_version; ?></dd>

                    <dt>Server</dt>
                    <dd><?php echo $_SERVER['SERVER_SOFTWARE']; ?></dd>
                </dl>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

    <!-- Bootstrap -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  </body>
</html>
