<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TrxPembelianBb
 *
 * @property int $id
 * @property int $id_bahan_baku
 * @property Carbon $tanggal_pembelian
 * @property int $harga_satuan
 * @property int $qty
 * @property int $total_harga
 * @property int $flag_delete
 *
 * @property BahanBaku $bahan_baku
 *
 * @package App\Models
 */
class TrxPembelianBb extends Model
{
	protected $table = 'trx_pembelian_bb';
	public $timestamps = false;

	protected $casts = [
		'id_bahan_baku' => 'int',
		'tanggal_pembelian' => 'datetime',
		'harga_satuan' => 'int',
		'qty' => 'int',
		'total_harga' => 'int',
		'flag_delete' => 'int'
	];

	protected $fillable = [
		'id_bahan_baku',
		'tanggal_pembelian',
		'harga_satuan',
		'qty',
		'total_harga',
		'flag_delete'
	];

	public function bahan_baku()
	{
		return $this->belongsTo(BahanBaku::class, 'id_bahan_baku');
	}
}
