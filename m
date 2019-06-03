Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 4952232CA9
	for <lists+drbd-dev@lfdr.de>; Mon,  3 Jun 2019 11:21:24 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 4E4841028A6C;
	Mon,  3 Jun 2019 11:21:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id C6EFB1028A64
	for <drbd-dev@lists.linbit.com>; Mon,  3 Jun 2019 11:21:21 +0200 (CEST)
Received: by mail-wr1-f44.google.com with SMTP id h1so11216938wro.4
	for <drbd-dev@lists.linbit.com>; Mon, 03 Jun 2019 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=D8EBJ8C3HvFz5r6YV8gGwy5X269DaEcu3UmNyiO3TMY=;
	b=pIm9efSRiigRyuuP1G/sUXOio6vSJhb1ORD5lbEW6b/E/EjY+zcXElzgTcrzHfMEMN
	zORQy4EYlv+k+hOtblvw4yotr9seD6xUdYw/ywXooQgnsd2JiFnGMDWTNyZvlb9CBYP7
	07Cl9lAk6rQF7CHpizGi/cIkfDD/IfL3g4fNFCPv3oGKU5S0LG7NBLN6sA0E77+MhKkl
	HjOmGWgjkPi7egmrl4bdspvotoKafwW1HDFEh8LNXgslZRsSvTLvt0Oib0hJ7UCjpyyF
	C8SPCO5rJw123S/k7e/grrkroPMKAr4TIz/xKNgxza/TZ49vvC2+kZHy+Ee15VyIiO4M
	VVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=D8EBJ8C3HvFz5r6YV8gGwy5X269DaEcu3UmNyiO3TMY=;
	b=tFX0D2Tl7FeGKF7CDlOR3M1t0/G37jvaCDD7hQE6eLYOhaWiWRQDlljBt3gtYI9bZv
	bIAJ6hjkefPy9x0t7X4EZSf4ujxGY2iR93voZnty+x0HWCCYImeWMRbVH2LCmfNQMlo2
	OJRHYCASUc1sU9r1+e0/aYSmTVYybShoLlBMe1B+Gp+XtGleVsoMLiHLsMorgroNHN3z
	HkVyCx5rE/ye3enaBC7cD9TmmbSXvD761iuSMicZONOzPY4BrLYe01gA/TvRlWZLew81
	wifOB2SUrgwqg1xXf8T7qr9lwTx8SJ/HmavTirsRgMzxCxtpQStAR5sSUPz9Mq6HpXJn
	w2Gg==
X-Gm-Message-State: APjAAAXHm3UeQoQGisy7QX6B4oWQeSvscIDzQ6RmpH8rJWkzATbR6RUV
	drs3mz5dKgl9Y8s3z7k0NLl1JcIvDmNgjQ==
X-Google-Smtp-Source: APXvYqz6jPYmFaGzZxtRAAn62lNo2W/keoRb/BITxTY54UI3w0u3Nm5l+PXwWja+UArFtKyL850x0w==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr14744521wrp.149.1559553680886;
	Mon, 03 Jun 2019 02:21:20 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	t14sm15817646wrr.33.2019.06.03.02.21.19
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jun 2019 02:21:20 -0700 (PDT)
Date: Mon, 3 Jun 2019 11:21:18 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190603092118.GH5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] drbd_nl.c:drbd_adm_prepare() indexes drbd_genl_ops[]
 by cmd number
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Fri, May 31, 2019 at 01:01:24PM -0600, David Butterfield wrote:
> (Is this the right place to send comments on the source code such as this=
 one?)
> =

> In drbd_nl.c:
> =

>   static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
>   	struct sk_buff *skb, struct genl_info *info, unsigned flags)
>   {
>   	struct drbd_genlmsghdr *d_in =3D info->userhdr;
>   	const u8 cmd =3D info->genlhdr->cmd;
>   	int err;
>   =

>   	memset(adm_ctx, 0, sizeof(*adm_ctx));
>   =

> + 	//XXX I do not think you can find the ops for a command number by inde=
xing this array.
> + 	//XXX The array is unordered and packed.  I think it must search like =
genl_get_cmd().


drbd_genl_ops is a static struct genl_ops [], indexed by cmd.

family->ops is a struct genl_ops*, pointing to an array
indexed by "i" [0 .. (family->n_ops - 1)]

Any specific reason you are spending time with this code in particular?

>   	/*
>   	 * genl_rcv_msg() only checks if commands with the GENL_ADMIN_PERM flag
>   	 * set have CAP_NET_ADMIN; we also require CAP_SYS_ADMIN for
>   	 * administrative commands.
>   	 */
>   	if ((drbd_genl_ops[cmd].flags & GENL_ADMIN_PERM) &&
>   	    drbd_security_netlink_recv(skb, CAP_SYS_ADMIN))
>   		return -EPERM;
>   =

>   	adm_ctx->reply_skb =3D genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
>   	if (!adm_ctx->reply_skb) {
>   		err =3D -ENOMEM;
>   		goto fail;
>   	}

-- =

: Lars Ellenberg
: LINBIT | Keeping the Digital World Running
: DRBD -- Heartbeat -- Corosync -- Pacemaker
: R&D, Integration, Ops, Consulting, Support

DRBD=AE and LINBIT=AE are registered trademarks of LINBIT
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
