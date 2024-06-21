<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class HistorySaldo
 *
 * @property int $id
 * @property int $id_customer
 * @property Carbon $timestamp
 * @property int $nominal
 * @property int $saldo_akhir
 * @property string $catatan
 * @property int $diproses
 *
 * @property Customer $customer
 *
 * @package App\Models
 */
class HistorySaldo extends Model
{
	protected $table = 'history_saldo';
	public $timestamps = false;

	protected $casts = [
		'id_customer' => 'int',
		'timestamp' => 'datetime',
		'nominal' => 'int',
		'saldo_akhir' => 'int',
		'diproses' => 'int'
	];

	protected $fillable = [
		'id_customer',
		'timestamp',
		'nominal',
		'saldo_akhir',
		'catatan',
		'diproses'
	];

	public function customer()
	{
		return $this->belongsTo(Customer::class, 'id_customer');
	}
}
