<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Penitip
 * 
 * @property int $id
 * @property string $nama
 * @property string $alamat
 * @property string $no_telp
 * 
 * @property Collection|Produk[] $produks
 *
 * @package App\Models
 */
class Penitip extends Model
{
	protected $table = 'penitip';
	public $timestamps = false;

	protected $fillable = [
		'nama',
		'alamat',
		'no_telp'
	];

	public function produks()
	{
		return $this->hasMany(Produk::class, 'id_penitip');
	}
}
