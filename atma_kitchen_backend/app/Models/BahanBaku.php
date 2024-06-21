<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class BahanBaku
 *
 * @property int $id
 * @property string $nama
 * @property string $satuan
 * @property int $stok
 *
 * @property Collection|ProdukBahan[] $produk_bahans
 * @property Collection|TrxPemakaianBb[] $trx_pemakaian_bbs
 * @property Collection|TrxPembelianBb[] $trx_pembelian_bbs
 *
 * @package App\Models
 */
class BahanBaku extends Model
{
	protected $table = 'bahan_baku';
	public $timestamps = false;

	protected $casts = [
		'stok' => 'int'
	];

	protected $fillable = [
		'nama',
		'satuan',
		'stok'
	];

	public function produk_bahans()
	{
		return $this->hasMany(ProdukBahan::class, 'id_bahan_baku');
	}

	public function trx_pemakaian_bbs()
	{
		return $this->hasMany(TrxPemakaianBb::class, 'id_bahan_baku');
	}

	public function trx_pembelian_bbs()
	{
		return $this->hasMany(TrxPembelianBb::class, 'id_bahan_baku');
	}
}
