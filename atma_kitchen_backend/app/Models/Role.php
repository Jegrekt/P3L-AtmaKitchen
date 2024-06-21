<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Role
 *
 * @property string $id
 * @property string $nama
 * @property int $gaji_dasar_harian
 *
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Role extends Model
{
	protected $table = 'roles';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'gaji_dasar_harian' => 'int'
	];

	protected $fillable = [
		'nama',
		'gaji_dasar_harian'
	];

	public function hide($fields)
	{
		$this->hidden = $fields;
		return $this;
	}

	public function users()
	{
		return $this->hasMany(User::class, 'role');
	}
}
