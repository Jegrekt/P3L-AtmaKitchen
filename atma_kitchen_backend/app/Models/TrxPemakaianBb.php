<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TrxPemakaianBb
 * 
 * @property int $id
 * @property int|null $id_bahan_baku
 * @property int $id_trx_penjualan
 * @property Carbon $tanggal
 * @property int $qty
 * 
 * @property TrxPenjualan $trx_penjualan
 * @property BahanBaku|null $bahan_baku
 *
 * @package App\Models
 */
class TrxPemakaianBb extends Model
{
	protected $table = 'trx_pemakaian_bb';
	public $timestamps = false;

	protected $casts = [
		'id_bahan_baku' => 'int',
		'id_trx_penjualan' => 'int',
		'tanggal' => 'datetime',
		'qty' => 'int'
	];

	protected $fillable = [
		'id_bahan_baku',
		'id_trx_penjualan',
		'tanggal',
		'qty'
	];

	public function trx_penjualan()
	{
		return $this->belongsTo(TrxPenjualan::class, 'id_trx_penjualan');
	}

	public function bahan_baku()
	{
		return $this->belongsTo(BahanBaku::class, 'id_bahan_baku');
	}
}
