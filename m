Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 303252C3A5F
	for <lists+drbd-dev@lfdr.de>; Wed, 25 Nov 2020 08:55:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3851C420641;
	Wed, 25 Nov 2020 08:55:23 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF873420168
	for <drbd-dev@lists.linbit.com>; Tue, 24 Nov 2020 22:32:47 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id t3so343054pgi.11
	for <drbd-dev@lists.linbit.com>; Tue, 24 Nov 2020 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=nUebvx46WK355IC8BSYKhA86maU/C5TyOra9y/oS07E=;
	b=lzAwh4po+9zegkg/2K9x7CHiUUthvj2PFJyxHwt1QdcZQIdrGCSiE3JgzWuDiv+VMN
	KwBJ/6n/jsAIvSMb6eOJqvl2BVv6D2OMXP8giSKXaaH9JwLNdR2oULKAXe3g8bDVfAub
	65Ll+320/JpDsvMBOWCFVSOrRLSDK1WOgK6ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=nUebvx46WK355IC8BSYKhA86maU/C5TyOra9y/oS07E=;
	b=I54hYfvR1ZNZng8wCRm5vhUQeDHDYXk3kLZmGIxcsmmRstcqIVxQ43EViUZYa2ekY5
	2G5yAROL0UifEr6QrkT5AP4rbVP/zBT2v/hKaDqpKNTQzG9NsMT0qybZ6WLYJ3usZc9s
	BfbFcrXePr31eTcZ2flCUM9tNdMmrZHjukwu+ddbtPUG/hzdAoWLSphhYFy1mnBMVPcO
	YAj03WXLA24MQenKTWD5OGFw8RjG5R3+w285WEKNUjum78z5yBmTLPdlH0BNBKl4FZRG
	FDNaV6lF5Rf1i0Q36gBK815PxU9fuAOAzrAuepYJB4/1vKAvFdJe/jKfg7Zl+2FltDJL
	4Idw==
X-Gm-Message-State: AOAM532zK120MXF1Z6V1kdxC/xDAP9gg8ACICrTZ/lTPu19wFH2wbWoX
	iZpsjEsvjtSkQG3ITEtkQkaA8w==
X-Google-Smtp-Source: ABdhPJxq53hoH5g966jwbYjUDwfs6lHQ9KOfN5qCJ8fiAFBBjxy/+X2rEoTmF5zSw2rlwmYa8QmuBA==
X-Received: by 2002:aa7:9af2:0:b029:198:273c:6be8 with SMTP id
	y18-20020aa79af20000b0290198273c6be8mr329847pfp.4.1606253566848;
	Tue, 24 Nov 2020 13:32:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id j74sm15845pfd.43.2020.11.24.13.32.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Nov 2020 13:32:45 -0800 (PST)
Date: Tue, 24 Nov 2020 13:32:44 -0800
From: Kees Cook <keescook@chromium.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Message-ID: <202011241327.BB28F12F6@keescook>
References: <202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
	<0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
	<d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
	<dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
	<20201123130348.GA3119@embeddedor>
	<8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:55:20 +0100
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
	target-devel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
	samba-technical@lists.samba.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-scsi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, linux-atm-general@lists.sourceforge.net,
	ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	linux-mmc@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
	GR-Linux-NIC-Dev@marvell.com, linux-watchdog@vger.kernel.org,
	selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
	reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
	Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
	x86@kernel.org
Subject: Re: [Drbd-dev] [Intel-wired-lan] [PATCH 000/141] Fix fall-through
 warnings for Clang
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Mon, Nov 23, 2020 at 08:31:30AM -0800, James Bottomley wrote:
> Really, no ... something which produces no improvement has no value at
> all ... we really shouldn't be wasting maintainer time with it because
> it has a cost to merge.  I'm not sure we understand where the balance
> lies in value vs cost to merge but I am confident in the zero value
> case.

What? We can't measure how many future bugs aren't introduced because the
kernel requires explicit case flow-control statements for all new code.

We already enable -Wimplicit-fallthrough globally, so that's not the
discussion. The issue is that Clang is (correctly) even more strict
than GCC for this, so these are the remaining ones to fix for full Clang
coverage too.

People have spent more time debating this already than it would have
taken to apply the patches. :)

This is about robustness and language wrangling. It's a big code-base,
and this is the price of our managing technical debt for permanent
robustness improvements. (The numbers I ran from Gustavo's earlier
patches were that about 10% of the places adjusted were identified as
legitimate bugs being fixed. This final series may be lower, but there
are still bugs being found from it -- we need to finish this and shut
the door on it for good.)

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
