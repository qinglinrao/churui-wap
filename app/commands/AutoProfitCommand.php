<?php

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;

class AutoProfitCommand extends Command {

	/**
	 * The console command name.
	 *
	 * @var string
	 */
	protected $name = 'auto:profit';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = '订单签收或评论7天后自动分润.';

	/**
	 * Create a new command instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Execute the console command.
	 *
	 * @return mixed
	 */
	public function fire()
	{

        //已收货或已评价 已经支付  没有分润 支付时间超过两分钟的订单
        $orders = Order::whereIn('status_id',[4,5])->where('is_payed',1)->where('is_profited',0)->where('pay_at','<=',Carbon::now()->subMinutes(2))->get();

        $this->info('--自动扫描-'.Carbon::now());
        foreach($orders as $order){
            if($order->order_type ==  1){   //普通订单处理
                $this->info('普通订单');
                $this->info($order);
                try{
                    DB::beginTransaction();
                    $products = $order->products;
                    if($products){
                        foreach($products as $product){  //遍历每个customer_order_products(OrderProduct表)

                            if($product->ownAgent){  //通过customer_order_products的agent_id的字段来判断上一级买家
                                $merchant = $product->ownAgent;
                                if($merchant){
                                    $x = 1;
                                    $customer = $order->buyer;

                                    $merchant_profit_money = get_product_profit_churui($product->product,$merchant,true,$x) * $product->quantity;

                                    $merchant->money += $merchant_profit_money;
                                    //$merchant->shop_profit += $merchant_profit_money;

                                    if($merchant->leader){
                                        $x += 1;
                                        $merchant->leader_profit += get_product_profit_churui($product->product,$merchant->leader,false,$x) * $product->quantity;
                                    }


                                    $merchant->total_profit += $merchant_profit_money;
                                    $this->info('给ID:'.$merchant->id.'NAME:'.$merchant->detail->username.'分润:'.$merchant_profit_money);

                                    $this->updateCustomerLeaderProfit($customer,$merchant,$merchant_profit_money);
                                    $this->addProfitLog('',$merchant,$order,$product->product,$merchant_profit_money,true);
                                    $merchant->save();

                                        $a=1;

                                        while($a<=2 && $merchant->leader){

                                            $leader = $merchant->leader;
                                            $leader_profit_money = get_product_profit_churui($product->product,$leader,false,$x) * $product->quantity;

                                            $leader->money += $leader_profit_money;
//                                        $leader->shop_profit += $leader_profit_money;

                                            if($leader->leader){

                                                $x += 1;

                                                $leader->leader_profit += get_product_profit_churui($product->product,$leader->leader,false,$x) * $product->quantity;
                                            }
                                            $leader->total_profit += $leader_profit_money;
                                            $leader->follower_profit += $merchant_profit_money;
                                            $this->info('给ID:'.$leader->id.'NAME:'.$leader->detail->username.'分润:'.$leader_profit_money);
                                            $leader->save();
                                            $merchant = $leader;
                                            $this->updateCustomerLeaderProfit($customer,$merchant,$leader_profit_money);
                                            $this->addProfitLog('',$merchant,$order,$product->product,$leader_profit_money,false);

                                            $a++;
                                        }

                                }

                            }

                        }

                       $order->is_profited = 1;
                        $order->save();
                    }

                    DB::commit();
                }catch (Exception $e){
                    $this->info('error'.$e->getMessage());
                    DB::rollBack();
                }
            }
            else{   //定制订单
                try {
                    DB::beginTransaction();

                    $adviser = $order->adviser;
                    $this->info('定制订单');
                    if($adviser){
                        $products = $order->products;
                        foreach($products as $product) {
                            $adviser->money += $product->product->ba_profit * $product->quantity;
                        }
                        $adviser->save();
                        $this->info('给专家ID:'.$adviser->id.'NAME:'.$adviser->mobile.'分润:'.$adviser->money);
                    }

                    $order->is_profited = 1;
                    $order->save();

                    DB::commit();

                }catch (Exception $e){
                    DB::rollBack();
                }
            }
        }

        //判断每一个订单，代理能分多少。
        $orders2 = Order::where('is_expected',0)->get();

        //$orders = Order::whereIn('status_id',[4,5])->where('is_payed',1)->where('is_profited',0)->where('pay_at','<=',Carbon::now()->subMinutes(2))->get();

        //$this->info('--自动扫描-'.Carbon::now());
        foreach($orders2 as $order){
            if($order->order_type ==  1){   //普通订单处理
                // $this->info('普通订单');
                //$this->info($order);
                try{
                    DB::beginTransaction();
                    $products = $order->products;
                    if($products){
                        foreach($products as $product){  //遍历每个customer_order_products(OrderProduct表)

                            if($product->ownAgent){  //通过customer_order_products的agent_id的字段来判断上一级买家
                                $merchant = $product->ownAgent;
                                if($merchant){
                                    $x = 1;
                                    $customer = $order->buyer;

                                    $merchant_profit_money = get_product_profit_churui($product->product,$merchant,true,$x);

                                    // $merchant->money += $merchant_profit_money;
                                    //$merchant->shop_profit += $merchant_profit_money;

                                    if($merchant->leader){
                                        $x += 1;
                                        $merchant->leader_profit += get_product_profit_churui($product->product,$merchant->leader,false,$x) * $product->quantity;
                                    }


                                    //$merchant->total_profit += $merchant_profit_money;
                                    //$this->info('给ID:'.$merchant->id.'NAME:'.$merchant->detail->username.'分润:'.$merchant_profit_money);

                                    // $this->updateCustomerLeaderProfit($customer,$merchant,$merchant_profit_money);
                                    $this->addProfitLog('expect',$merchant,$order,$product->product,$merchant_profit_money,true);
                                    //$merchant->save();

                                    $a=1;

                                    while($a<=2 && $merchant->leader){

                                        $leader = $merchant->leader;
                                        $leader_profit_money = get_product_profit_churui($product->product,$leader,false,$x);

                                        // $leader->money += $leader_profit_money;
//                                        $leader->shop_profit += $leader_profit_money;

                                        if($leader->leader){

                                            $x += 1;

                                            $leader->leader_profit += get_product_profit_churui($product->product,$leader->leader,false,$x) * $product->quantity;
                                        }
                                        // $leader->total_profit += $leader_profit_money;
                                        // $leader->follower_profit += $merchant_profit_money;
                                        //$this->info('给ID:'.$leader->id.'NAME:'.$leader->detail->username.'分润:'.$leader_profit_money);
                                        // $leader->save();
                                        $merchant = $leader;
                                        // $this->updateCustomerLeaderProfit($customer,$merchant,$leader_profit_money);
                                        $this->addProfitLog('expect',$merchant,$order,$product->product,$leader_profit_money,false);

                                        $a++;
                                    }

                                }

                            }

                        }

                        $order->is_expected = 1;
                        $order->save();
                    }

                    DB::commit();
                }catch (Exception $e){
                    $this->info('error'.$e->getMessage());
                    DB::rollBack();
                }
            }

        }
	}



    /**
     * 修改客户给上级带来的总利润
     * @param $customer 客户对象
     * @param $merchant 上级商家
     * @param $profit 分润额
     */
    protected function updateCustomerLeaderProfit($customer,$merchant,$profit){
        if($customer->leader){
            if($merchant->id == $customer->leader->id){
                $customer->leader_profit += $profit;
                $customer->save();
            }
        }

        $customer->total_profit  += $profit;
        $customer->save();

    }

    /**
     * 添加商家账户分润日志
     * @param $merchant 商家
     * @param $order 订单
     * @param $product 订单产品
     * @param $money 分润额
     * @param $direct 直接或间接  true or false
     */
    public function addProfitLog($type='normal',$merchant,$order,$product,$money,$direct){
        $account = $merchant->account;
        if($account){
            $account_log = new CustomerAccountLog();
            $account_log->money = $money;
            $account_log->trade_type = 1; //交易类别 0:支出  1:收入
            $account_log->operate_type = 2; //操作类别 1:提现 2:佣金
            $account_log->customer_id = $merchant->id;
            $account_log->order_id = $order->id;
            if($type=='expect'){
                $account_log->type = $type;
            }
            //$account_log->alipay_account = $account->alipay_account;
            $account_log->status = 2;
            $account_log->log = '从订单【'.$order->order_sn.($direct?'】直接':'】间接').'获得分润￥'.$money.'
            (产品ID:'.$product->id.';SKU:'.$product->sku.';销售价:'.$product->sale_price.';分润额:'.$product->profit.';
            分润配置:[第三级分润:'.$product->three_profit.'%,第二级分润:'.$product->two_profit.'%,第三级分润:'.$product->first_profit.'%]
            )';
            $account_log->save();
        }else{
            $this->info('没有找到账户');
        }
    }
}
