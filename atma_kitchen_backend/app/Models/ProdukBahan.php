<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ProdukBahan
 * 
 * @property int $id
 * @property int $id_bahan_baku
 * @property int $id_produk
 * @property int $qty
 * 
 * @property Produk $produk
 * @property BahanBaku $bahan_baku
 *
 * @package App\Models
 */
class ProdukBahan extends Model
{
	protected $table = 'produk_bahan';
	public $timestamps = false;

	protected $casts = [
		'id_bahan_baku' => 'int',
		'id_produk' => 'int',
		'qty' => 'int'
	];

	protected $fillable = [
		'id_bahan_baku',
		'id_produk',
		'qty'
	];

	public function produk()
	{
		return $this->belongsTo(Produk::class, 'id_produk');
	}

	public function bahan_baku()
	{
		return $this->belongsTo(BahanBaku::class, 'id_bahan_baku');
	}
}
