Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FD433ABE5
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Mar 2021 08:01:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6AF3A42061A;
	Mon, 15 Mar 2021 08:01:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EADCA420231
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 11:55:34 +0100 (CET)
Received: by mail-wm1-f49.google.com with SMTP id g20so3530154wmk.3
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 02:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U8krqYE8Ef8qnGsiAipJzGQpaVm5t8lDtkhTxaSOQf8=;
	b=yo+0Pv1vGiiRr+BRTMkp3T9EiYl7WyqiXEjQPicDPEauSFiYyR62sktJewMDa8dedY
	TtEdyo/qjJQ2oVaYRSQ7M53MZM7dmCSqleG5phx9kfrPM/3iQZKaUrptoZGtnKshKPhT
	k8vBK+orZOsk37DTLhw4a5zMwn0ZRe0W0KpUJE4c2vUJnFGNzRTKNOrfj7BUVsMiySCS
	KpG8zUZke0l4urksnmr+8FXqKdvK/LQQp9twKzZeG5Anzi66F3YJXeBbnAbLfyEs9Mdm
	33HdF8a5+NO+J+PGn7XcVBn02oWNoEAEpdVHkH2yt2jK9lzPK6A0zywtAJ78xDs41uwS
	Okkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U8krqYE8Ef8qnGsiAipJzGQpaVm5t8lDtkhTxaSOQf8=;
	b=szPT6u4q1GyJkaHGW9SOJLR1ZVi7DtO2G2QvgJ1sZ1A7lCnIFcL0UJMFTiGHWbQq7u
	Z3e0mzABaZ+uoZWpvenn6Y3KSGv+YwMd77JwIViZ4PWu/CDORL3LO+VlweZ/AF4X0gYK
	T32UZxdL9NsI561PYN15yrAW7cx0lWwBMXiAQeip+rZgxh5SXJSNott16DSHO54NBSB6
	EP3M7bUX1rPBeCDmYrxV2qx5IW2BvdzofV6YKTeV38B0UWinpTBQetPBVELrXZVAgdlO
	EAE9GuPINin7Z+Pxo+3VvIROVXb3zmfPMnOyeO1uVqW7I3o9lejQmNcISQ3qaLh93wLM
	Q4Aw==
X-Gm-Message-State: AOAM532k19r3Uf41C9dIt7rMJ++i62RXr6rNUazR8KNVwdx/HHho1I0r
	f9gX4ZpzZggts4r9FTaQX5e5lg==
X-Google-Smtp-Source: ABdhPJwGy2yiZng+8p42AiTsODzcXCoCU2A55jsurjv+Rkg7hZ8K/NGYGP3VtK/HkA0LP08aOZ4tBg==
X-Received: by 2002:a1c:7e16:: with SMTP id z22mr12397544wmc.74.1615546534304; 
	Fri, 12 Mar 2021 02:55:34 -0800 (PST)
Received: from dell.default ([91.110.221.204])
	by smtp.gmail.com with ESMTPSA id
	q15sm7264962wrr.58.2021.03.12.02.55.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 12 Mar 2021 02:55:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 12 Mar 2021 10:55:19 +0000
Message-Id: <20210312105530.2219008-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:01:35 +0100
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	xen-devel@lists.xenproject.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 00/11] Rid W=1 warnings from Block
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

VGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11
cCBXPTEKa2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSBy
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCkxlZSBKb25lcyAoMTEpOgogIGJs
b2NrOiByc3h4OiBjb3JlOiBSZW1vdmUgc3VwZXJmbHVvdXMgY29uc3QgcXVhbGlmaWVyCiAgYmxv
Y2s6IGRyYmQ6IGRyYmRfaW50ZXJ2YWw6IERlbW90ZSBzb21lIGtlcm5lbC1kb2MgYWJ1c2VzIGFu
ZCBmaXgKICAgIGFub3RoZXIgaGVhZGVyCiAgYmxvY2s6IG10aXAzMnh4OiBtdGlwMzJ4eDogTWFy
ayBkZWJ1Z2dpbmcgdmFyaWFibGUgJ3N0YXJ0JyBhcwogICAgX19tYXliZV91bnVzZWQKICBibG9j
azogZHJiZDogZHJiZF9zdGF0ZTogRml4IHNvbWUgZnVuY3Rpb24gZG9jdW1lbnRhdGlvbiBpc3N1
ZXMKICBibG9jazogZHJiZDogZHJiZF9yZWNlaXZlcjogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtl
cm5lbC1kb2MgaGVhZGVycwogIGJsb2NrOiBkcmJkOiBkcmJkX21haW46IFJlbW92ZSBkdXBsaWNh
dGUgZmllbGQgaW5pdGlhbGlzYXRpb24KICBibG9jazogZHJiZDogZHJiZF9ubDogTWFrZSBjb252
ZXJzaW9uIHRvICdlbnVtIGRyYmRfcmV0X2NvZGUnIGV4cGxpY2l0CiAgYmxvY2s6IGRyYmQ6IGRy
YmRfbWFpbjogRml4IGEgYnVuY2ggb2YgZnVuY3Rpb24gZG9jdW1lbnRhdGlvbgogICAgZGlzY3Jl
cGFuY2llcwogIGJsb2NrOiBkcmJkOiBkcmJkX3JlY2VpdmVyOiBEZW1vdGUgbGVzcyB0aGFuIGhh
bGYgY29tcGxldGUga2VybmVsLWRvYwogICAgaGVhZGVyCiAgYmxvY2s6IHhlbi1ibGtmcm9udDog
RGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2VzCiAgYmxvY2s6IGRyYmQ6IGRyYmRfbmw6IERlbW90ZSBo
YWxmLWNvbXBsZXRlIGtlcm5lbC1kb2MgaGVhZGVycwoKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X2ludGVydmFsLmMgfCAgOCArKysrKy0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5j
ICAgICB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbmwuYyAgICAgICB8IDE3ICsrKysrKysrKystLS0tLS0tCiBkcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9yZWNlaXZlci5jIHwgMjYgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvYmxvY2svZHJiZC9kcmJkX3N0YXRlLmMgICAgfCAgNyArKysrLS0tCiBkcml2ZXJzL2Js
b2NrL210aXAzMnh4L210aXAzMnh4LmMgIHwgIDIgKy0KIGRyaXZlcnMvYmxvY2svcnN4eC9jb3Jl
LmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyAgICAgICB8
ICA2ICsrKy0tLQogOCBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlv
bnMoLSkKCkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpD
YzogZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpDYzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVs
LmRrPgpDYzogSm9zaHVhIE1vcnJpcyA8am9zaC5oLm1vcnJpc0B1cy5pYm0uY29tPgpDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogTGFycyBFbGxlbmJlcmcgPGxhcnMuZWxsZW5iZXJn
QGxpbmJpdC5jb20+CkNjOiBsaW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IFBoaWxpcCBL
ZWxsZWhlciA8cGprMTkzOUBsaW51eC5pYm0uY29tPgpDYzogUGhpbGlwcCBSZWlzbmVyIDxwaGls
aXBwLnJlaXNuZXJAbGluYml0LmNvbT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0gCjIuMjcuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGlu
ZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29t
L21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
