<?php
/**
 * Created by PhpStorm.
 * User: hardywen
 * Date: 15/1/8
 * Time: 下午5:08
 */

class Attribute extends Base{

	protected $table = 'category_attributes';

	public function values(){
		return $this->hasMany('AttributeValue','attribute_id');
	}
}