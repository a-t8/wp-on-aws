module network {
    source = "git::https://github.com/a-t8/tf-modules-wp-on-aws.git//network?ref=network"
    vpc_cidr_block = var.vpc_cidr_block
    max_subnets = var.max_subnets
    is_dns_support = var.is_dns_support
    is_dns_hostname = var.is_dns_hostname
    managed_by = var.managed_by
    public_sn_count = var.public_sn_count
    private_sn_count = var.private_sn_count
    public_sn_cidrs = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, local.newbits, i)]
    private_sn_cidrs = [for i in range(1, 255, 2) : cidrsubnet(local.vpc_cidr, local.newbits, i)]
    all_ips_allowed = var.all_ips_allowed
    is_vpc = var.is_vpc
}
