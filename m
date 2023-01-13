Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA37669CA6
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 16:43:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22D504217B3;
	Fri, 13 Jan 2023 16:43:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BD0F1420202
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 16:43:30 +0100 (CET)
Received: by mail-il1-f181.google.com with SMTP id o13so10933054ilc.7
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=aMDRFQNMM2p+WOSwQ9Dba5m08/eqZCwGnutuShqS2I0=;
	b=bGjx8gC+nt5yLHeWJhR7JzVbtjLaL40agjy66eW4Tk8RWtrhc12wcNn6fkhEG6y/jZ
	6cLWZWJan3dr7e+4w59+lgy7w4UqMn8/VcQcjyA2XFPiw6l3CjNs5ROH9ZgdtVZQ054l
	AWyM1p0sXu1xbdZIg2jHm+WliH2vi36pirBaH4JXl653dlRY8hOEacTlvv37Qe0KQBVp
	bQDpPqVMM6bPM9apFNY1dfUiHT8AKyn/laJrmIja8wn3E8R43uky+Fffh/QrEodPu645
	pGejc3dIerQZjDuPALpaGhI3JcztfmmoziUlHgAh4nzPhnR+AMmfQISrWzN3+k22k0Sk
	clQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=aMDRFQNMM2p+WOSwQ9Dba5m08/eqZCwGnutuShqS2I0=;
	b=0VDha3t2VbK5H+8G+qepJiqsX7DuSVzOLACuYtk9eXaYsemLWCsTPbU1xHUDLCGjSm
	CalRQGid1k8Ay/E9geBwfX9N0AzhO+wRx+mfLGOuDPMnZNaSlw+MwVDPLpPg3qFl2v4d
	X4Wyq1SKhjqvdlaEVDTXt1nHe9pDoEwp5lNxyqkIkUsf5Hqc31zErE5y4es6ItS/24tZ
	LOimcCxxFLNgTsOPINAgl9qUvuF72vaZumSpw/n0PBQrbkF4+LNzn7AyU5KD79IM1Aw6
	qAWVqMVwYElE+8Na4MF6fXZRzE3GEGOaM4uf7/DdD8VyugDK8V5lxtQtBeG8m8H+8nH3
	vT6A==
X-Gm-Message-State: AFqh2kpTBwArRBBAf14ymzrrkDBFXSXrmGVxZDmCCxptrdn0+G2B3aQc
	OAEt6Fm9tttT4j8VIFQvza6neqMtTosP+vjv
X-Google-Smtp-Source: AMrXdXtxFHd2A+4/Ksfx8D+/irZoy4dYAzcM0F/2HZJcXPHxaCnvJignIzh+g3mVFjIGPbgOFqaGLg==
X-Received: by 2002:a92:b703:0:b0:30c:1dda:42dd with SMTP id
	k3-20020a92b703000000b0030c1dda42ddmr7873529ili.1.1673624609549;
	Fri, 13 Jan 2023 07:43:29 -0800 (PST)
Received: from [127.0.0.1] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	125-20020a020a83000000b0039dc4d26bd2sm6193106jaw.58.2023.01.13.07.43.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 07:43:29 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
References: <20230113123506.144082-1-christoph.boehmwalder@linbit.com>
Message-Id: <167362460873.11790.14664102108857579461.b4-ty@kernel.dk>
Date: Fri, 13 Jan 2023 08:43:28 -0700
MIME-Version: 1.0
X-Mailer: b4 0.12-dev-78c63
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RESEND PATCH 0/3] DRBD file structure reorganization
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

Ck9uIEZyaSwgMTMgSmFuIDIwMjMgMTM6MzU6MDMgKzAxMDAsIENocmlzdG9waCBCw7ZobXdhbGRl
ciB3cm90ZToKPiBUbyBtYWtlIG91ciBsaXZlcyBlYXNpZXIgd2hlbiBzZW5kaW5nIGZ1dHVyZSwg
bW9yZSBjb21wbGV4IHBhdGNoZXMsCj4gd2Ugd2FudCB0byBhbGlnbiB0aGUgZmlsZSBzdHJ1Y3R1
cmUgYXMgYmVzdCBhcyBwb3NzaWJsZSB3aXRoIHdoYXQgd2UKPiBoYXZlIGluIHRoZSBvdXQtb2Yt
dHJlZSBtb2R1bGUuCj4gCj4gQ2hyaXN0b3BoIELDtmhtd2FsZGVyICgzKToKPiAgIGRyYmQ6IHNw
bGl0IG9mZiBkcmJkX2J1aWxkdGFnIGludG8gc2VwYXJhdGUgZmlsZQo+ICAgZHJiZDogZHJvcCBB
UElfVkVSU0lPTiBkZWZpbmUKPiAgIGRyYmQ6IHNwbGl0IG9mZiBkcmJkX2NvbmZpZyBpbnRvIHNl
cGFyYXRlIGZpbGUKPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvM10gZHJiZDogc3Bs
aXQgb2ZmIGRyYmRfYnVpbGR0YWcgaW50byBzZXBhcmF0ZSBmaWxlCiAgICAgIGNvbW1pdDogYzA1
OGM5YzlkY2IxMzdmMzk1ZTE5NDZiMGYzNTk1NTM4NDc5YjNmZApbMi8zXSBkcmJkOiBkcm9wIEFQ
SV9WRVJTSU9OIGRlZmluZQogICAgICBjb21taXQ6IGE2ODE3NmUwZjdjZjFiNjhhODRjM2I3YzA4
MjcxYWYwZDNkMmU3OTYKWzMvM10gZHJiZDogc3BsaXQgb2ZmIGRyYmRfY29uZmlnIGludG8gc2Vw
YXJhdGUgZmlsZQogICAgICBjb21taXQ6IDI2NTQ3Y2I0MWE5ZjQ1OTUzNTMwMDI3NWEzMTk2ODFh
NzBjZjY5ZmUKCkJlc3QgcmVnYXJkcywKLS0gCkplbnMgQXhib2UKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRy
YmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4v
bGlzdGluZm8vZHJiZC1kZXYK
