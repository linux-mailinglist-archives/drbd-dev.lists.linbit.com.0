Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CB77E360292
	for <lists+drbd-dev@lfdr.de>; Thu, 15 Apr 2021 08:44:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D7FCC42039D;
	Thu, 15 Apr 2021 08:44:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 508B24202B2
	for <drbd-dev@lists.linbit.com>; Thu, 15 Apr 2021 08:35:41 +0200 (CEST)
Received: by mail-lf1-f52.google.com with SMTP id x19so6974182lfa.2
	for <drbd-dev@lists.linbit.com>; Wed, 14 Apr 2021 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=dEZ7hWNfAUpbbgZ/Iu/tWrezll59mZ6nHLCx2h8jntQ=;
	b=Ml0G9D62k7wU424xsvHZAyLurOjqYEbXgkNb6vf73DZQo4pquTeMUGn6hr9dhP1yCw
	ts3jMwOPqdlZt8Yj7EL/0cSqPUmO/SzN8WzuVseVK2fwZHtLz/3pWKr8zuk9dZni0epx
	CP8BgG+mN7LqWxF0smhU3W0JY69/bCo6zb84v9jaPFytSJ6yydwDO1n+PRokns2Wfi50
	zpho4N9H7ZC4LNQ3Q98YAkWMseBwCWYoKvyBbyrmPn3dkAC6kOwV4IwydcOtuFyrndCw
	AkHtYYh7U7azQbb3qQJJfLTLQ9GZYJrcZhLuquELQxKLa5bBhOAVVkqqd9MLIxIrTegK
	BODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=dEZ7hWNfAUpbbgZ/Iu/tWrezll59mZ6nHLCx2h8jntQ=;
	b=qrEAKSkx0SmL+8ecuIjaNHsIoLpWHC6j4GCfiKTgTXmoXf+pp0qTQjYEXU0Xmlv9Nf
	FfZXyB1brFKLXXpPeONXLSEx38s3LdaC2S3+4btcUZZRa/eenDVwDeAvfjaobDTrQsjI
	0FRsFD06djn+DY5psF1JC4wdw9FmI2tq0ACOSKV8kIRBCdd71hEA4tGwBfwWICBkRwby
	HFfYIS1bE6tp3L0dawV2DGc01zBxs8zxRj8jNbXlHnaES+j76UmRi9wcfas/ORbgu9Vl
	GGgF4bM07BPDdM7W9w3z7/8WPQKynQtyYMBPh2jp/vHjAI1EjVeS5iVmVxDw1sUdo2fg
	VRJA==
X-Gm-Message-State: AOAM53276Icxli9Q+ybZQPasFdUeywgqWmD5cuo77bVMUCJrpuaTvrNf
	zUOjFKR6nuQwwPOtCl3Kq1b8RPSDoQTcqdqtSP3LsAu9zEXuHokZ
X-Google-Smtp-Source: ABdhPJwjUk5bkKwoONlBKjvE0vp0BZETK5WpbUO1qk/39xK9PK0KQg1aKz1GrpbeYxis5JLB3f6S0aZwIEuf59nUxOI=
X-Received: by 2002:a19:ec19:: with SMTP id b25mr1393329lfa.99.1618468540601; 
	Wed, 14 Apr 2021 23:35:40 -0700 (PDT)
MIME-Version: 1.0
From: Li Ming <tolimit1019@gmail.com>
Date: Thu, 15 Apr 2021 14:35:29 +0800
Message-ID: <CAOW5tATdY0jxWVmemJXhfDzwzTvmzhyiELnwGmCtraDVD5eonQ@mail.gmail.com>
To: drbd-dev@lists.linbit.com
Content-Type: multipart/mixed; boundary="0000000000007162c905bffd124e"
X-Mailman-Approved-At: Thu, 15 Apr 2021 08:44:18 +0200
Subject: [Drbd-dev] 0001-check-head-in-page_chain_del-for-every-loop.patch
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--0000000000007162c905bffd124e
Content-Type: multipart/alternative; boundary="0000000000007162c705bffd124c"

--0000000000007162c705bffd124c
Content-Type: text/plain; charset="UTF-8"



--0000000000007162c705bffd124c
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--0000000000007162c705bffd124c--
--0000000000007162c905bffd124e
Content-Type: application/octet-stream; 
	name="0001-check-head-in-page_chain_del-for-every-loop.patch"
Content-Disposition: attachment; 
	filename="0001-check-head-in-page_chain_del-for-every-loop.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_knii2nwr0>
X-Attachment-Id: f_knii2nwr0

RnJvbSAzMzZiODcwODE4MzVmNWZjYzNmZGQ0ZTJjODgyM2I2MWM1MGExYjJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaW5nIExpIDx0b2xpbWl0MTAxOUBnbWFpbC5jb20+CkRhdGU6
IFRodSwgMTUgQXByIDIwMjEgMTM6MDk6MTggKzA4MDAKU3ViamVjdDogW1BBVENIXSBjaGVjayBo
ZWFkIGluIHBhZ2VfY2hhaW5fZGVsIGZvciBldmVyeSBsb29wCgp0aGVyZSB3aWxsIGJlIGNyYXNo
IHdoZW4gd2UgZ2V0IGEgTlVMTCBoZWFkIGluIGxvb3AuCgpTaWduZWQtb2ZmLWJ5OiBNaW5nIExp
IDx0b2xpbWl0MTAxOUBnbWFpbC5jb20+Ci0tLQogZHJiZC9kcmJkX3JlY2VpdmVyLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJiZC9kcmJkX3JlY2VpdmVyLmMgYi9kcmJkL2RyYmRfcmVjZWl2ZXIuYwppbmRl
eCBmMTI3YTIzNS4uMjhmYjJlMDYgMTAwNjQ0Ci0tLSBhL2RyYmQvZHJiZF9yZWNlaXZlci5jCisr
KyBiL2RyYmQvZHJiZF9yZWNlaXZlci5jCkBAIC0yODAsMTIgKzI4MCwxMiBAQCBzdGF0aWMgc3Ry
dWN0IHBhZ2UgKnBhZ2VfY2hhaW5fZGVsKHN0cnVjdCBwYWdlICoqaGVhZCwgaW50IGNvdW50KQog
CUJVR19PTighaGVhZCk7CiAKIAlwYWdlID0gUkVBRF9PTkNFKCpoZWFkKTsKLQlpZiAoIXBhZ2Up
Ci0JCXJldHVybiBOVUxMOwogCiAJZG8gewogCQluID0gY291bnQ7CiAJCXJ2X2hlYWQgPSBwYWdl
OworCQlpZiAoIXBhZ2UpCisJCQlyZXR1cm4gTlVMTDsKIAkJd2hpbGUgKHRydWUpIHsKIAkJCXRt
cCA9IHBhZ2VfY2hhaW5fbmV4dChwYWdlKTsKIAkJCWlmICgtLW4gPT0gMCkKLS0gCjIuMjQuMyAo
QXBwbGUgR2l0LTEyOCkKCg==
--0000000000007162c905bffd124e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--0000000000007162c905bffd124e--
