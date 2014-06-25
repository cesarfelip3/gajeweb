<?php

/* index.twig */
class __TwigTemplate_ee552f701e4c34bd750f24b950954304514727550d8ea07fecce376851a797b9 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = $this->env->loadTemplate("layout.default.twig");

        $this->blocks = array(
            'left_sidebar' => array($this, 'block_left_sidebar'),
            'body' => array($this, 'block_body'),
        );
    }

    protected function doGetParent(array $context)
    {
        return "layout.default.twig";
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        $this->parent->display($context, array_merge($this->blocks, $blocks));
    }

    // line 3
    public function block_left_sidebar($context, array $blocks = array())
    {
        // line 4
        echo "    <li class=\"active\"><a href=\"/gajeweb/admin/\"><i class=\"fa fa-dashboard\"></i> Dashboard</a></li>
    <li><a href=\"/gajeweb/admin/image\"><i class=\"fa fa-bar-chart-o\"></i> Image</a></li>
    <li><a href=\"/gajeweb/admin/user\"><i class=\"fa fa-table\"></i> User</a></li>
    <li><a href=\"/gajeweb/admin/theme\"><i class=\"fa fa-edit\"></i> Theme</a></li>
";
    }

    // line 10
    public function block_body($context, array $blocks = array())
    {
        // line 11
        echo "
    <div class=\"row\">
        <div class=\"col-lg-12\">
            <h1>Dashboard
                <small>Statistics Overview</small>
            </h1>
            <ol class=\"breadcrumb\">
                <li class=\"active\"><i class=\"fa fa-dashboard\"></i> Dashboard</li>
            </ol>
            <div class=\"alert alert-success alert-dismissable\" style=\"display: none;\">
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
    }

    public function getTemplateName()
    {
        return "index.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  43 => 11,  40 => 10,  32 => 4,  29 => 3,);
    }
}
