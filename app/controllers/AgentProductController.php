<?php

class AgentProductController extends BaseController {

    public $customer;

    function __construct(){
        $this->customer = Auth::customer()->check()?Auth::customer()->user():null;
    }

    public function AgentProductDetail(){
        return View::make('customers.agent.product_detail');
    }


}
