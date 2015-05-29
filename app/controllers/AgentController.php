<?php

class AgentController extends BaseController {

    public $customer;

    function __construct(){
        $this->customer = Auth::customer()->check()?Auth::customer()->user():null;
    }

    public function getIndex(){
        $customer = $this->customer;
        //我的订单总数
        $orders = Order::where('agent_id',$this->customer->id)->count();

        //二级会员和订单总数
        $two_agents = Customer::where('leader_id',$this->customer->id)->get();
        $two_order = $this->getNextAgentOrder($two_agents);
        $two_money = $this->getNextAgentMoney($two_agents);

        //三级会员和订单总数
        $three_agents = $this->getNextAgent($two_agents);
        $three_order = $this->getNextAgentOrder($three_agents);
        $three_money = $this->getNextAgentMoney($three_agents);
        $four_agents = $this->getNextAgent($three_agents);

        return View::make('customers.agent.index',compact('customer','orders','two_agents','three_agents','four_agents'
            ,'two_order','three_order','two_money','three_money'));
    }

    public function getAgentMyOrders(){

        //全部
        $orders = Order::with('products.product.image')->where('agent_id',$this->customer->id)->get();
        //未付款
        $orders2 = Order::with('products.product.image')->where('agent_id',$this->customer->id)->whereIn('status_id',array('1'))->get();
        //已付款
        $orders3 = Order::with('products.product.image')->where('agent_id',$this->customer->id)->whereIn('status_id',array('2','3','4','5','6','12'))->get();
        //已分润
        $orders4 = Order::where('agent_id',$this->customer->id)->where('is_profited',1)->orderBy('pay_at','desc')->get();

        //查询出已经分润的有几个日期
        $arr = array();
        $profit_orders = array();
        foreach($orders4 as $order){
            $time = date("Y-m-d",strtotime($order->pay_at));
            if (!in_array($time, $arr)) {
                $arr[] = $time;
            }
        }

        //根据日期来查询已经分润的订单
        foreach($arr as $a){
            $profit_orders["$a"] = Order::with('products.product.image')->where('agent_id',$this->customer->id)->where('is_profited',1)->where('pay_at','like','%'.$a.'%')->get();
        }


        $merchant = $this->customer;


        return View::make('customers.agent.my_orders',compact('orders','orders2','orders3','orders4','profit_orders','merchant'));
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


    public function AgentDetail($id){
        $product = Product::where('id',$id)->first();

        return View::make('customers.agent.detail',compact('product'));
    }

    public function getCode($id){
        $customer_id = Auth::customer()->check()?Auth::customer()->user()->id:0;

        $value="http://120.24.164.194:8070/agent/product/6/detail?CID=".base64_encode($customer_id);

        $errorCorrectionLevel = "L";
        $matrixPointSize = "3";
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
            $order_num += Order::where('agent_id', $order->id)->count();
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
