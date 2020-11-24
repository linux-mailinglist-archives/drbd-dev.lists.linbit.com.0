Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67A2C1B0D
	for <lists+drbd-dev@lfdr.de>; Tue, 24 Nov 2020 02:46:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AFD424207CB;
	Tue, 24 Nov 2020 02:46:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1C76F4207BB
	for <drbd-dev@lists.linbit.com>; Tue, 24 Nov 2020 02:46:54 +0100 (CET)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
	[163.114.132.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D0FEE206FA;
	Tue, 24 Nov 2020 01:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606182413;
	bh=l8PzaObySRRsk8Qr2VGSW2cE2KYLeZxGCFjBrnWF/Lc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UW7qkn00cv0wKiMaPmt66xG3QkCT8bOVJt7eg3jDQbxlQGPJk4mx/VqCDN8ptUhlR
	dhn0h/4nyOm1M8zdsuA37E4QjM+7Riaqfpsc9IapZPm4KcMQtw7px4ieszGaMfwO0Z
	lfMGoIgQ4EohQhNLmkPGid0CCriQVWDtDbY9z+UQ=
Date: Mon, 23 Nov 2020 17:46:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20201123174648.6a22575b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
	linux-atm-general@lists.sourceforge.net,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	32-BIT AND 64-BIT <" <x86@kernel.org>,  xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org,  Nathan  Chancellor <natechancellor@gmail.com>,  Miguel Ojeda <ojeda@kernel.org>,  Joe  Perches <joe@perches.com>"@domain.invalid>,
	bridge@lists.linux-foundation.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	"maintainer:X86"@domain.invalid, ARCHITECTURE@domain.invalid,
	GR-Linux-NIC-Dev@marvell.com, Kees Cook <keescook@chromium.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, GR-everest-linux-l2@marvell.com,
	ceph-devel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-ext4@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-hams@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	op-tee@lists.trustedfirmware.org, oss-drivers@netronome.com,
	patches@opensource.cirrus.com, rds-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org, samba-technical@lists.samba.org,
	selinux@vger.kernel.org, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	usb-storage@lists.one-eyed-alien.net,
	virtualization@lists.linux-foundation.org,
	wcn36xx@lists.infradead.org, "@domain.invalid"@linbit.com
Subject: Re: [Drbd-dev] [PATCH 000/141] Fix fall-through warnings for Clang
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gTW9uLCAyMyBOb3YgMjAyMCAxNzozMjo1MSAtMDgwMCBOaWNrIERlc2F1bG5pZXJzIHdyb3Rl
Ogo+IE9uIFN1biwgTm92IDIyLCAyMDIwIGF0IDg6MTcgQU0gS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMjAsIDIwMjAgYXQgMTE6NTE6NDJB
TSAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6ICAKPiA+ID4gSWYgbm9uZSBvZiB0aGUgMTQw
IHBhdGNoZXMgaGVyZSBmaXggYSByZWFsIGJ1ZywgYW5kIHRoZXJlIGlzIG5vIGNoYW5nZQo+ID4g
PiB0byBtYWNoaW5lIGNvZGUgdGhlbiBpdCBzb3VuZHMgdG8gbWUgbGlrZSBhIFc9MiBraW5kIG9m
IGEgd2FybmluZy4gIAo+ID4KPiA+IEZXSVcsIHRoaXMgc2VyaWVzIGhhcyBmb3VuZCBhdCBsZWFz
dCBvbmUgYnVnIHNvIGZhcjoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FGQ3dm
MTFpekhGPWcxbUdyeTFmRTVrdkZGRnJ4emhQU002cUtBTzhneFNwPUtyX0NRQG1haWwuZ21haWwu
Y29tLyAgCj4gCj4gU28gbG9va3MgbGlrZSB0aGUgYnVsayBvZiB0aGVzZSBhcmU6Cj4gc3dpdGNo
ICh4KSB7Cj4gICBjYXNlIDA6Cj4gICAgICsreDsKPiAgIGRlZmF1bHQ6Cj4gICAgIGJyZWFrOwo+
IH0KPiAKPiBJIGhhdmUgYSBwYXRjaCB0aGF0IGZpeGVzIHRob3NlIHVwIGZvciBjbGFuZzoKPiBo
dHRwczovL3Jldmlld3MubGx2bS5vcmcvRDkxODk1Cgrwn5iNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRl
dkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RyYmQtZGV2Cg==
