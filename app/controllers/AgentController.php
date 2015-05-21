<?php

class AgentController extends BaseController {

    public $customer;

    function __construct(){
        $this->customer = Auth::customer()->check()?Auth::customer()->user():null;
    }

    public function getIndex(){

        $customer = Auth::customer()->check()?Auth::customer()->user():null;
        $orders = Order::customer()->get();

        //二级会员和订单总数
        $two_agents = Customer::where('leader_id',$customer->id)->get();
        $two_order = $this->getNextAgentOrder($two_agents);
        $two_money = $this->getNextAgentMoney($two_agents);

        //三级会员和订单总数
        $three_agents = $this->getNextAgent($two_agents);
        $three_order = $this->getNextAgentOrder($three_agents);
        $three_money = $this->getNextAgentMoney($three_agents);
        $four_agents = $this->getNextAgent($three_agents);

        return View::make('customers.agent.index',compact('customer','two_agents','three_agents','four_agents'
            ,'orders','two_order','three_order','two_money','three_money'));
    }

    public function getAgentOrders($id){

        if($id == 1){
            $orders = Order::with('products.product.image')->where('customer_id',$this->customer->id)->get();

        }

        if($id > 1){
            $agents = Customer::where('leader_id',$this->customer)->get();
            $ids = $this->get_next_agent_ids($agents);
            $orders = Order::with('products.product.image')->whereIn('customer_id',$ids)->get();
        }

        if($id > 2){
            $ids = $this->get_next_agent_ids($agents);
            $orders = Order::with('products.product.image')->whereIn('customer_id',$ids)->get();
        }




        return View::make('customers.agent.orders',compact('orders'));
    }

    public function getAgentNextMembers($id){

        if($id > 0){
            $next_agents = Customer::where('leader_id', $this->customer->id)->get();
        }
        if($id > 1){
            $next_agents = $this->get_next_agents($next_agents);
        }
        if($id > 2){
            $next_agents = $this->get_next_agents($next_agents);
        }
        return View::make('customers.agent.next_members', compact('next_agents','id'));
    }

    public function getAgentOrderLists(){
        //所有订单
        $orders = $this->get_total_orders($this->customer);
        $orders1 = $this->get_total_orders($this->customer,1);
        $orders3 = $this->get_total_orders($this->customer,3);
        $orders4 = $this->get_total_orders($this->customer,4);
        return View::make('customers.agent.order_lists',compact('orders','orders1','orders3','orders4'));
    }

    public function getAgentOrderDetail($id){

        return View::make('customers.agent.order_detail');
    }


    public function ProductsDetail($id){
        $product = Product::where('id',$id)->first();

        return View::make('customers.agent.detail',compact('product'));
    }

    public function getCode($id){

        $value="http://m.unesmall.com/products/".$id;
        $errorCorrectionLevel = "L";
        $matrixPointSize = "10";
        QRcode::png($value, false, $errorCorrectionLevel, $matrixPointSize);
        exit;
    }

    //获取所有下级会员
    public function getNextAgent($agents){

        $next_agents = array();
        foreach($agents as $customer){
            $a = Customer::where('leader_id',$customer->id)->first();
            if(!empty($a)){
                $next_agents[] = $a;
            }
        }
        return $next_agents;
    }

    //获取下级会员的订单总数
    public function getNextAgentOrder($agents){

        $order_num = '';
        foreach($agents as $order){
            $order_num += Order::where('customer_id', $order->id)->count();
        }
        return $order_num;
    }

    //获取下级会员总的营业额和佣金
    public function getNextAgentMoney($agents){
        $money = array('','');
        foreach($agents as $agent){
            $money[0] += $agent->total_profit;
            $money[1] += $agent->money;
        }
        return $money;
    }
}
