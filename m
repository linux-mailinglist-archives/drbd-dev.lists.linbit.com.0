Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 589362C4EF3
	for <lists+drbd-dev@lfdr.de>; Thu, 26 Nov 2020 07:47:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94A8942066A;
	Thu, 26 Nov 2020 07:47:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EB1FC420377
	for <drbd-dev@lists.linbit.com>; Thu, 26 Nov 2020 00:02:44 +0100 (CET)
Received: by mail-wr1-f65.google.com with SMTP id m6so87103wrg.7
	for <drbd-dev@lists.linbit.com>; Wed, 25 Nov 2020 15:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ha42UWMtlXOL8kfvC1XpFKttY73p7G2gxviD5bIo2Ac=;
	b=cK16XuXEr1UlZZi/GgHF7dItPstb+7yZ2QUTp5Dxvdc6OIX52ygirnUAKuRVBOH+dK
	A20pmgUIw2HuGZFFAXCmBSAdjpUAnHlbQW6vzVJQphFFEbO8NHcI7pY1E1IYv6o5k0Qf
	jXWsM0ddqTXTn/1nZTXycpkYVMfbhxZxJ9mV7kOEU+Tec/es0pgNM20lzmzFkZBYIURn
	HK2FiFuW7CXMZxeXIL3yJ5bCH/J8M2hkcorgk3PecLezXYs+oTw3zVRlNq6FEGJfSXMe
	e5NpXkmlA2dB6AmhViUGWqJQAiQop1G/7Q0C0bZUhlLDOGEFt9XX9+Dv47nZ0Rj6T1x/
	IsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ha42UWMtlXOL8kfvC1XpFKttY73p7G2gxviD5bIo2Ac=;
	b=O2CocM4OuxHauDXUPHIJEnZIZxEZNpCsfYq6VyPPqnQD8zQK5UPxQd+4VVnfQiTG2O
	HIpP1CF6x92voTSUlKa9AhqA3yXHjUV/SEqxkrc71axXoNfoJ7Ydavq2K/dU1jnFo8+Z
	/m45JDE06IPGhXBf9ouU1ER9PjAop6kKk4HUWemd80UYIBiRG5rOLR3O+Cv4I/qjNDmJ
	MtE3cH/hIHlYD+Woz7epJbECHsr8/BVFuzzhLWuKBjULsngOf8ryWLIuNHXK/PekFBc8
	VJrZadPy8PPf2lASklPufKjWtZUN9DWNH6/C9KSxf2NMeCNm6hEHdCP09L/RGkSr/2iB
	QRpw==
X-Gm-Message-State: AOAM5324gI2gBq3Qmn7A4+1f6fZANeMCcGoc9Hzw9Zc14/C/nnwVSC7E
	ggIC/o40U8Bqju/KhnQzZAw=
X-Google-Smtp-Source: ABdhPJzir63ZhkohioP0Ktx42tkGcEWW5m4eKxg+CUjAscHddZDwqHZSdjbm/E0JNHFBggGwkKFODQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr180470wrs.235.1606345364309; 
	Wed, 25 Nov 2020 15:02:44 -0800 (PST)
Received: from [192.168.1.122]
	(cpc92720-cmbg20-2-0-cust364.5-4.cable.virginm.net. [82.21.83.109])
	by smtp.gmail.com with ESMTPSA id
	u129sm5552667wme.9.2020.11.25.15.02.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 25 Nov 2020 15:02:43 -0800 (PST)
To: Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
	<202011241324.B3439A2@keescook>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <99a9ffd7-6356-b81d-6e08-7ed74b6fb82c@gmail.com>
Date: Wed, 25 Nov 2020 23:02:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <202011241324.B3439A2@keescook>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 26 Nov 2020 07:47:05 +0100
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-scsi@vger.kernel.org,
	linux-rdma@vger.kernel.org, oss-drivers@netronome.com,
	bridge@lists.linux-foundation.org, linux-security-module@vger.kernel.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
	linux-media@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
	linux-can@vger.kernel.org, linux-block@vger.kernel.org,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	Linux Memory Management List <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com,
	Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
	target-devel@vger.kernel.org
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

T24gMjQvMTEvMjAyMCAyMToyNSwgS2VlcyBDb29rIHdyb3RlOgo+IEkgc3RpbGwgdGhpbmsgdGhp
cyBpc24ndCByaWdodCAtLSBpdCdzIGEgY2FzZSBzdGF0ZW1lbnQgdGhhdCBydW5zIG9mZgo+IHRo
ZSBlbmQgd2l0aG91dCBhbiBleHBsaWNpdCBmbG93IGNvbnRyb2wgZGV0ZXJtaW5hdGlvbi4KClBy
b3ZlcyB0b28gbXVjaCDigJQgZm9yIGluc3RhbmNlCiAgICBjYXNlIGZvbzoKICAgIGNhc2UgYmFy
OgogICAgICAgIHRoaW5nOwogICAgICAgIGJyZWFrOwogZG9lc24ndCByZXF1aXJlIGEgZmFsbHRo
cm91Z2g7IGFmdGVyIGNhc2UgZm9vOiwgYW5kIGFmYWlrCiBuby1vbmUgaXMgc3VnZ2VzdGluZyBp
dCBzaG91bGQuICBZZXQgaXQsIHRvbywgaXMgImEgY2FzZQogc3RhdGVtZW50IHRoYXQgcnVucyBv
ZmYgdGhlIGVuZCB3aXRob3V0IGFuIGV4cGxpY2l0IGZsb3cKIGNvbnRyb2wgZGV0ZXJtaW5hdGlv
biIuCgotZWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9s
aXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
