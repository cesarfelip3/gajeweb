<?php


namespace Admin\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


use Admin\Controller\BaseController;
use Silex\Provider\TwigServiceProvider;
use Admin\Model\Image;
use Admin\Model\Theme;

class DownloadController extends BaseController
{

    public function __construct(Request $request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();

        $this->app->register(new TwigServiceProvider(), array(
            'twig.path' => realpath(__DIR__ . '/../View'),
            //'twig.options' => array(
            //    "cache" => realpath(__DIR__ . "/../cache")
            //)
        ));
    }

    public function themeList()
    {


        $response = new Response();
        $response->setTtl(5);

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 10);

        $data["page"] = intval($page) <= 0 ? 0 : intval($page);
        $data["page_size"] = $pageSize <= 10 ? 10 : intval($pageSize);

        $theme = new Theme();
        $headerArray = $theme->getThemeListHeader();
        $themeArray = $theme->getThemeList($data);

        $total = $theme->getTotal();

        foreach ($themeArray as &$data) {

            $data["create_date"] = date("Y-m-d", $data["create_date"]);
            $data["modified_date"] = date("Y-m-d", $data["modified_date"]);
        }

        $totalPage = ceil($total / $pageSize);
        $baseurl = "/gajeweb/admin";


        $i = (int)($page / 10) * 10;
        $i = $i <= 0 ? 0 : $i;

        $prev = $page - 1;
        $next = $page + 1;
        $next = $next >= $totalPage ? $totalPage - 1 : $next;

        $count = $i + 10;
        $count = $count >= $totalPage ? $totalPage : $count;

        $pagination = "<li><a href='$baseurl/downloader?page=$prev'>«</a></li>";

        for (; $i < $count; $i++) {

            $j = $i + 1;
            if ($i == $page) {

                $pagination .= "<li class='active'><a href='$baseurl/downloader?page=$i'>$j</a></li>";

            } else {

                $pagination .= "<li><a href='$baseurl/downloader?page=$i'>$j</a></li>";

            }
        }

        $pagination .= "<li><a href='$baseurl/downloader?page=$next'>»</a></li>";

        $response->setContent($this->app["twig"]->render("download_list.twig", array(
            "headerArray" => $headerArray,
            "themeArray" => $themeArray,
            "page" => $page,
            "pageSize" => $pageSize,
            "totalPages" => $total,
            "pagination" => $pagination,
            "error" => $error
        )));

        return $response;
    }


}