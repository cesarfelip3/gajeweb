<?php


namespace Admin\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


use Admin\Controller\BaseController;
use Silex\Provider\TwigServiceProvider;
use Admin\Model\Image;
use Admin\Model\User;

class ImageController extends BaseController
{

    public function __construct(Request $request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        //$this->response = new Response();

        $this->app->register(new TwigServiceProvider(), array(
            'twig.path' => realpath(__DIR__ . '/../View'),
            //'twig.options' => array(
            //    "cache" => realpath(__DIR__ . "/../cache")
            //)
        ));
    }

    public function imageList()
    {

        $response = new Response();
        $response->setTtl(5);

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data["page"] = intval($page) <= 0 ? 0 : intval($page);
        $data["page_size"] = $pageSize <= 25 ? 25 : intval($pageSize);

        $image = new Image();

        $headerArray = $image->getImageListHeader();
        $imageArray = $image->getImageList($data);

        $total = $image->getTotal();

        foreach ($imageArray as &$image) {

            $image["create_date"] = date("Y-m-d", $image["create_date"]);
            $image["modified_date"] = date("Y-m-d", $image["modified_date"]);

            $image["thumbnail"] = '<img src="http://' . $this->request->getHost() . "/upload/image/" . $image["thumbnail"] . '" style="width:280px" />';
            $image["#"] = '<a href="javascript:del(\'' . $image["image_uuid"] . '\');"> Delete </a>';
        }

        $totalPage = ceil ($total / $pageSize);
        $baseurl = "/gajeweb/admin";


        $i = (int)($page / 10) * 10;
        $i = $i <= 0 ? 0 : $i;

        $prev = $page - 1;
        $next = $page + 1;
        $next = $next >= $totalPage ? $totalPage - 1 : $next;

        $count = $i + 10;
        $count = $count >= $totalPage ? $totalPage : $count;

        $pagination = "<li><a href='$baseurl/image?page=$prev'>«</a></li>";

        for (;$i < $count; $i++) {

            $j = $i + 1;
            if ($i == $page) {

                $pagination .= "<li class='active'><a href='$baseurl/image?page=$i'>$j</a></li>";

            } else {

                $pagination .= "<li><a href='$baseurl/image?page=$i'>$j</a></li>";

            }
        }

        $pagination .= "<li><a href='$baseurl/image?page=$next'>»</a></li>";

        $response->setContent($this->app["twig"]->render("image_list.twig", array(
            "headerArray" => $headerArray,
            "imageArray" => $imageArray,
            "page" => $page,
            "pageSize" => $pageSize,
            "totalPages" => $total,
            "pagination" => $pagination,
            "deleteUrl" => 'http://' . $this->request->getHost() . "/gajeweb/admin/image/delete/"
        )));

        return $response;

    }

    public function getImage ()
    {
        $image_uuid = $this->request->get ("id", "");


    }

}