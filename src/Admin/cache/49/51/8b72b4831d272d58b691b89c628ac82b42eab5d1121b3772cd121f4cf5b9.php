<?php

/* layout.default.twig */
class __TwigTemplate_49518b72b4831d272d58b691b89c628ac82b42eab5d1121b3772cd121f4cf5b9 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
            'body' => array($this, 'block_body'),
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"utf-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <meta name=\"description\" content=\"\">
    <meta name=\"author\" content=\"\">

    <title>Dashboard - Gaje Web Admin</title>

    <!-- Bootstrap core CSS -->
    <link href=\"/gajeweb/web/css/bootstrap.css\" rel=\"stylesheet\">

    <!-- Add custom CSS here -->
    <link href=\"/gajeweb/web/css/sb-admin.css\" rel=\"stylesheet\">
    <link rel=\"stylesheet\" href=\"/gajeweb/web/font-awesome/css/font-awesome.min.css\">
    <!-- Page Specific CSS -->
    <link rel=\"stylesheet\" href=\"http://cdn.oesmith.co.uk/morris-0.4.3.min.css\">
</head>

<body>

<div id=\"wrapper\">

    <!-- Sidebar -->
    <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class=\"navbar-header\">
            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">
                <span class=\"sr-only\">Toggle navigation</span>
                <span class=\"icon-bar\"></span>
                <span class=\"icon-bar\"></span>
                <span class=\"icon-bar\"></span>
            </button>
            <a class=\"navbar-brand\" href=\"index.html\">Gaje Web Admin</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class=\"collapse navbar-collapse navbar-ex1-collapse\">
            <ul class=\"nav navbar-nav side-nav\">
                <li class=\"active\"><a href=\"index.html\"><i class=\"fa fa-dashboard\"></i> Dashboard</a></li>
                <li><a href=\"charts.html\"><i class=\"fa fa-bar-chart-o\"></i> Image</a></li>
                <li><a href=\"tables.html\"><i class=\"fa fa-table\"></i> User</a></li>
                <li><a href=\"forms.html\"><i class=\"fa fa-edit\"></i> Theme</a></li>
            </ul>

            <ul class=\"nav navbar-nav navbar-right navbar-user\" style=\"display:none\">
                <li class=\"dropdown messages-dropdown\">
                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-envelope\"></i> Messages
                        <span class=\"badge\">7</span> <b class=\"caret\"></b></a>
                    <ul class=\"dropdown-menu\">
                        <li class=\"dropdown-header\">7 New Messages</li>
                        <li class=\"message-preview\">
                            <a href=\"#\">
                                <span class=\"avatar\"><img src=\"http://placehold.it/50x50\"></span>
                                <span class=\"name\">John Smith:</span>
                                <span class=\"message\">Hey there, I wanted to ask you something...</span>
                                <span class=\"time\"><i class=\"fa fa-clock-o\"></i> 4:34 PM</span>
                            </a>
                        </li>
                        <li class=\"divider\"></li>
                        <li class=\"message-preview\">
                            <a href=\"#\">
                                <span class=\"avatar\"><img src=\"http://placehold.it/50x50\"></span>
                                <span class=\"name\">John Smith:</span>
                                <span class=\"message\">Hey there, I wanted to ask you something...</span>
                                <span class=\"time\"><i class=\"fa fa-clock-o\"></i> 4:34 PM</span>
                            </a>
                        </li>
                        <li class=\"divider\"></li>
                        <li class=\"message-preview\">
                            <a href=\"#\">
                                <span class=\"avatar\"><img src=\"http://placehold.it/50x50\"></span>
                                <span class=\"name\">John Smith:</span>
                                <span class=\"message\">Hey there, I wanted to ask you something...</span>
                                <span class=\"time\"><i class=\"fa fa-clock-o\"></i> 4:34 PM</span>
                            </a>
                        </li>
                        <li class=\"divider\"></li>
                        <li><a href=\"#\">View Inbox <span class=\"badge\">7</span></a></li>
                    </ul>
                </li>
                <li class=\"dropdown alerts-dropdown\">
                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-bell\"></i> Alerts <span
                            class=\"badge\">3</span> <b class=\"caret\"></b></a>
                    <ul class=\"dropdown-menu\">
                        <li><a href=\"#\">Default <span class=\"label label-default\">Default</span></a></li>
                        <li><a href=\"#\">Primary <span class=\"label label-primary\">Primary</span></a></li>
                        <li><a href=\"#\">Success <span class=\"label label-success\">Success</span></a></li>
                        <li><a href=\"#\">Info <span class=\"label label-info\">Info</span></a></li>
                        <li><a href=\"#\">Warning <span class=\"label label-warning\">Warning</span></a></li>
                        <li><a href=\"#\">Danger <span class=\"label label-danger\">Danger</span></a></li>
                        <li class=\"divider\"></li>
                        <li><a href=\"#\">View All</a></li>
                    </ul>
                </li>
                <li class=\"dropdown user-dropdown\">
                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-user\"></i> John Smith <b
                            class=\"caret\"></b></a>
                    <ul class=\"dropdown-menu\">
                        <li><a href=\"#\"><i class=\"fa fa-user\"></i> Profile</a></li>
                        <li><a href=\"#\"><i class=\"fa fa-envelope\"></i> Inbox <span class=\"badge\">7</span></a></li>
                        <li><a href=\"#\"><i class=\"fa fa-gear\"></i> Settings</a></li>
                        <li class=\"divider\"></li>
                        <li><a href=\"#\"><i class=\"fa fa-power-off\"></i> Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>

    <div id=\"page-wrapper\">

        <div class=\"row\">
            <div class=\"col-lg-12\">
                <h1>Dashboard
                    <small>Statistics Overview</small>
                </h1>
                <ol class=\"breadcrumb\">
                    <li class=\"active\"><i class=\"fa fa-dashboard\"></i> Dashboard</li>
                </ol>
                <div class=\"alert alert-success alert-dismissable\">
                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>
                    Welcome to SB Admin by <a class=\"alert-link\" href=\"http://startbootstrap.com\">Start Bootstrap</a>!
                    Feel free to use this template for your admin needs! We are using a few different plugins to handle
                    the dynamic tables and charts, so make sure you check out the necessary documentation links
                    provided.
                </div>
            </div>
        </div>
        <!-- /.row -->

        ";
        // line 134
        $this->displayBlock('body', $context, $blocks);
        // line 135
        echo "
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- JavaScript -->
<script src=\"/gajeweb/web/js/jquery-1.10.2.js\"></script>
<script src=\"/gajeweb/web/js/bootstrap.js\"></script>

<!-- Page Specific Plugins -->
<script src=\"http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js\"></script>
<script src=\"http://cdn.oesmith.co.uk/morris-0.4.3.min.js\"></script>
<script src=\"/gajeweb/web/js/morris/chart-data-morris.js\"></script>
<script src=\"/gajeweb/web/js/tablesorter/jquery.tablesorter.js\"></script>
<script src=\"/gajeweb/web/js/tablesorter/tables.js\"></script>

</body>
</html>
";
    }

    // line 134
    public function block_body($context, array $blocks = array())
    {
    }

    public function getTemplateName()
    {
        return "layout.default.twig";
    }

    public function getDebugInfo()
    {
        return array (  181 => 134,  157 => 135,  155 => 134,  20 => 1,  31 => 4,  28 => 3,);
    }
}
