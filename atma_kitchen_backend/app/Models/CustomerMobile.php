<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class CustomerMobile
 * 
 * @property int $id
 * @property int $id_customer
 * @property string $token
 * 
 * @property Customer $customer
 *
 * @package App\Models
 */
class CustomerMobile extends Model
{
	protected $table = 'customer_mobile';
	public $timestamps = false;

	protected $casts = [
		'id_customer' => 'int'
	];

	protected $hidden = [
		'token'
	];

	protected $fillable = [
		'id_customer',
		'token'
	];

	public function customer()
	{
		return $this->belongsTo(Customer::class, 'id_customer');
	}
}
