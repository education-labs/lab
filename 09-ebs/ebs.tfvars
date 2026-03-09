prefix              =       "user**"
region              =       "ap-northeast-2"
vpc_cidr            =       "10.0.0.0/16"

public_subnets      =       [
    {cidr = "10.0.1.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.0.3.0/24", availability_zone = "ap-northeast-2c"},
    ]

private_subnets = [
    {cidr = "10.0.11.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.0.13.0/24", availability_zone = "ap-northeast-2c"},
]

admin_access_cidrs  = ["116.127.84.104/32"]

ami_id                  =   "ami-067f964458129cf2e"
data_vol_snapshot_id    =   "snap-0462d26c70e5e0722"


instance_type       =   "t3.micro"
keypair_name        =   "user**-key"
data_volume_size        =   "15"
