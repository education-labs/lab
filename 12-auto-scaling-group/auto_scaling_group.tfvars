prefix                  =       "user-**"
region                  =       "ap-northeast-2"
vpc_cidr                =       "10.0.0.0/16"

public_subnets          =       [
    {cidr = "10.0.1.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.0.2.0/24", availability_zone = "ap-northeast-2b"},
    {cidr = "10.0.3.0/24", availability_zone = "ap-northeast-2c"},
    {cidr = "10.0.4.0/24", availability_zone = "ap-northeast-2d"},
]

private_subnets         =       [
    {cidr = "10.0.11.0/24", availability_zone = "ap-northeast-2a"},
    {cidr = "10.0.12.0/24", availability_zone = "ap-northeast-2b"},
    {cidr = "10.0.13.0/24", availability_zone = "ap-northeast-2c"},
    {cidr = "10.0.14.0/24", availability_zone = "ap-northeast-2d"},
]

admin_access_cidrs      =       ["<<YOUR_LOCAL_IP_CIDR>>"]

image_id                =       "ami-067f964458129cf2e"
data_vol_snapshot_id    =       "snap-0462d26c70e5e0722"
data_volume_size        =       "10"

instance_type           =       "t3.micro"
keypair_name            =       "<<YOUR_KEYPAIR_NAME>>"

port                    =       "80"
protocol                =       "HTTP"

min_size                =       1
max_size                =       4
desired_capacity        =       2
