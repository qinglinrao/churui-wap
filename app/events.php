<?php

/*
|------------------
| 注册模型观察者实例
|------------------
*/
Merchant::observe(new MerchantObserver());
Collection::observe(new CollectionObserver());
Customer::observe(new CustomerObserver());

Order::observe(new OrderObserver());