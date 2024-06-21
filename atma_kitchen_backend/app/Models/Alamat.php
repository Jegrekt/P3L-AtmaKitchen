<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Alamat
 * 
 * @property int $id
 * @property int $id_customer
 * @property string $alamat
 * @property float|null $jarak
 * 
 * @property Customer $customer
 * @property Collection|TrxPenjualan[] $trx_penjualans
 *
 * @package App\Models
 */
class Alamat extends Model
{
	protected $table = 'alamat';
	public $timestamps = false;

	protected $casts = [
		'id_customer' => 'int',
		'jarak' => 'float'
	];

	protected $fillable = [
		'id_customer',
		'alamat',
		'jarak'
	];

	public function customer()
	{
		return $this->belongsTo(Customer::class, 'id_customer');
	}

	public function trx_penjualans()
	{
		return $this->hasMany(TrxPenjualan::class, 'id_alamat');
	}
}
