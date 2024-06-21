<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Customer
 *
 * @property int $id_user
 * @property int $poin
 * @property int $saldo
 * @property Carbon $tanggal_lahir
 * @property string $no_telp
 *
 * @property User $user
 * @property Collection|Alamat[] $alamats
 * @property Collection|CustomerMobile[] $customer_mobiles
 * @property Collection|HistorySaldo[] $history_saldos
 * @property Collection|TrxPenjualan[] $trx_penjualans
 *
 * @package App\Models
 */
class Customer extends Model
{
	protected $table = 'customer';
	protected $primaryKey = 'id_user';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id_user' => 'int',
		'poin' => 'int',
		'saldo' => 'int',
		'tanggal_lahir' => 'datetime'
	];

	protected $fillable = [
		'poin',
		'saldo',
		'tanggal_lahir',
		'no_telp'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'id_user');
	}

	public function alamats()
	{
		return $this->hasMany(Alamat::class, 'id_customer');
	}

	public function customer_mobiles()
	{
		return $this->hasMany(CustomerMobile::class, 'id_customer');
	}

	public function history_saldos()
	{
		return $this->hasMany(HistorySaldo::class, 'id_customer');
	}

	public function trx_penjualans()
	{
		return $this->hasMany(TrxPenjualan::class, 'id_customer');
	}
}
