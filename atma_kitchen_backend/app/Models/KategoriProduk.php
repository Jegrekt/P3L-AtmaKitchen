<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class KategoriProduk
 * 
 * @property int $id
 * @property string $nama
 * @property string $satuan
 * 
 * @property Collection|Produk[] $produks
 *
 * @package App\Models
 */
class KategoriProduk extends Model
{
	protected $table = 'kategori_produk';
	public $timestamps = false;

	protected $fillable = [
		'nama',
		'satuan'
	];

	public function produks()
	{
		return $this->hasMany(Produk::class, 'id_kategori');
	}
}
