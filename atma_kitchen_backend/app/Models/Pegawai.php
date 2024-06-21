<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pegawai
 *
 * @property int $id_user
 * @property string $alamat
 * @property int|null $bonus
 * @property string $no_telp
 *
 * @property User $user
 * @property Collection|Ketidakhadiran[] $ketidakhadirans
 * @property Collection|PembayaranGaji[] $pembayaran_gajis
 *
 * @package App\Models
 */
class Pegawai extends Model
{
	protected $table = 'pegawai';
	protected $primaryKey = 'id_user';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id_user' => 'int',
		'bonus' => 'int'
	];

	protected $fillable = [
		'alamat',
		'bonus',
		'no_telp'
	];

	public function hide($fields)
	{
		$this->hidden = $fields;
		return $this;
	}

	public function user()
	{
		return $this->belongsTo(User::class, 'id_user');
	}

	public function ketidakhadirans()
	{
		return $this->hasMany(Ketidakhadiran::class, 'id_pegawai');
	}

	public function pembayaran_gajis()
	{
		return $this->hasMany(PembayaranGaji::class, 'id_pegawai');
	}
}
