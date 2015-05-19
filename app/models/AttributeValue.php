<?php
/**
 * Created by PhpStorm.
 * User: hardywen
 * Date: 15/1/8
 * Time: 下午5:05
 */

class AttributeValue extends Base {

	protected $table = 'category_attribute_values';

	public function attribute(){
		return $this->belongsTo('Attribute','attribute_id');
	}

}