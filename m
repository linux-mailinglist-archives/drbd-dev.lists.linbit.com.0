Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B446D0135
	for <lists+drbd-dev@lfdr.de>; Thu, 30 Mar 2023 12:29:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC9494210CC;
	Thu, 30 Mar 2023 12:29:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A92964210CE
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 12:27:52 +0200 (CEST)
Received: by mail-wr1-f52.google.com with SMTP id t4so13298438wra.7
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1680172072;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=8tFot2qeZ2g5bJSVqE02JTKqWWEEsYCP5AgrPPpbM1g=;
	b=Kr79JUVmumwV3+sEie0htPM48raEk+XVN3Uigb4cPgz/Cwmmf2oedq9OELQ6vyXtK8
	Dm9nnTEzKOh0DsIg7z6KNN7AmuRWpDYSyJEKipM0uIJXOJTyxPTHftT9AH93utfGowMI
	6h+iHcfpohSBCDRVGzhWGQuNspw9LqCqebu19K9R6pxGDipKf5Nzir9Beq20sXWa0JqN
	xhuOQQVKRMX0leG+Trmm1hKWS/udYwoVtsuW/Ktl1lOHJnBKqXFv+y+vynPabLSsMar1
	bVMA8Z4oIwh9uLBzrCN+7RlswnX5LYLW59Kbl14Nh56ZvwcQsBkVMI32l4JwDsQz1jwY
	Qcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1680172072;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=8tFot2qeZ2g5bJSVqE02JTKqWWEEsYCP5AgrPPpbM1g=;
	b=ZoM58tbu64kruylCKzrplnryoTKUIp3e8msAwgMPDB9yo+YloklAxyYji7pVSnsFPV
	y/CFBS5iM+KB57c0OpQDx3j2S0Eo7HADQanEb4nP2xPylhO7qsdSq1UOSHcjK9nT3Nud
	dbbAuT11QkNbIpXj45PqqCdgX2f4+OjVnIl55u/ebVk7JTQdXDWRyVMlSi3tPfCvZI/z
	m/ufEowcOc5K7UdgC4AYFTBdN+bXcg4OYfVVp0TgZiDeA9z6K0htsEzB+TLxbr3oO5fu
	+zEH+tlYzkairatUnmkWg7lqLnAozLhHZP0mrHw8ajt6/YkODjmV0zDl0o7rlMmQ/uMb
	36RA==
X-Gm-Message-State: AAQBX9didSKuzxt5RkmPncSyQU6mR4/O5A5h+oxt3dOi1v4F9Ar5vqu8
	z+nNkUIpoXJeTWK3MGiPx/6t+f5D
X-Google-Smtp-Source: AKy350b6LQoA5rGQpqDLFBlNL2/hnQq/IHj6AGMX6wydVEoKh/bfJ+60nOh+uj6nzNDIzsJxF6z8kw==
X-Received: by 2002:a5d:4dca:0:b0:2ce:9fb8:b560 with SMTP id
	f10-20020a5d4dca000000b002ce9fb8b560mr18901769wru.8.1680172072026;
	Thu, 30 Mar 2023 03:27:52 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	s11-20020adff80b000000b002d6f285c0a2sm26352514wrp.42.2023.03.30.03.27.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Mar 2023 03:27:51 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 12:27:42 +0200
Message-Id: <20230330102744.2128122-6-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
References: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v3 5/7] drbd: drbd_uuid_compare: pass a
	peer_device
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIHwg
OSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyBiL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKaW5kZXggYzZmOTNhOTA4N2IxLi5lMzUy
ODgwYzcwYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMK
KysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwpAQCAtMzIyNiwxMCArMzIy
NiwxMSBAQCBzdGF0aWMgdm9pZCBkcmJkX3V1aWRfZHVtcChzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRl
dmljZSwgY2hhciAqdGV4dCwgdTY0ICp1dWlkLAogLTEwOTYgICByZXF1aXJlcyBwcm90byA5Ngog
ICovCiAKLXN0YXRpYyBpbnQgZHJiZF91dWlkX2NvbXBhcmUoc3RydWN0IGRyYmRfZGV2aWNlICpj
b25zdCBkZXZpY2UsIGVudW0gZHJiZF9yb2xlIGNvbnN0IHBlZXJfcm9sZSwgaW50ICpydWxlX25y
KSBfX211c3RfaG9sZChsb2NhbCkKK3N0YXRpYyBpbnQgZHJiZF91dWlkX2NvbXBhcmUoc3RydWN0
IGRyYmRfcGVlcl9kZXZpY2UgKmNvbnN0IHBlZXJfZGV2aWNlLAorCQllbnVtIGRyYmRfcm9sZSBj
b25zdCBwZWVyX3JvbGUsIGludCAqcnVsZV9ucikgX19tdXN0X2hvbGQobG9jYWwpCiB7Ci0Jc3Ry
dWN0IGRyYmRfcGVlcl9kZXZpY2UgKmNvbnN0IHBlZXJfZGV2aWNlID0gZmlyc3RfcGVlcl9kZXZp
Y2UoZGV2aWNlKTsKLQlzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25zdCBjb25uZWN0aW9uID0g
cGVlcl9kZXZpY2UgPyBwZWVyX2RldmljZS0+Y29ubmVjdGlvbiA6IE5VTEw7CisJc3RydWN0IGRy
YmRfY29ubmVjdGlvbiAqY29uc3QgY29ubmVjdGlvbiA9IHBlZXJfZGV2aWNlLT5jb25uZWN0aW9u
OworCXN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlID0gcGVlcl9kZXZpY2UtPmRldmljZTsKIAl1
NjQgc2VsZiwgcGVlcjsKIAlpbnQgaSwgajsKIApAQCAtMzQ2NSw3ICszNDY2LDcgQEAgc3RhdGlj
IGVudW0gZHJiZF9jb25ucyBkcmJkX3N5bmNfaGFuZHNoYWtlKHN0cnVjdCBkcmJkX3BlZXJfZGV2
aWNlICpwZWVyX2RldmljZSwKIAlkcmJkX3V1aWRfZHVtcChkZXZpY2UsICJwZWVyIiwgZGV2aWNl
LT5wX3V1aWQsCiAJCSAgICAgICBkZXZpY2UtPnBfdXVpZFtVSV9TSVpFXSwgZGV2aWNlLT5wX3V1
aWRbVUlfRkxBR1NdKTsKIAotCWhnID0gZHJiZF91dWlkX2NvbXBhcmUoZGV2aWNlLCBwZWVyX3Jv
bGUsICZydWxlX25yKTsKKwloZyA9IGRyYmRfdXVpZF9jb21wYXJlKHBlZXJfZGV2aWNlLCBwZWVy
X3JvbGUsICZydWxlX25yKTsKIAlzcGluX3VubG9ja19pcnEoJmRldmljZS0+bGRldi0+bWQudXVp
ZF9sb2NrKTsKIAogCWRyYmRfaW5mbyhkZXZpY2UsICJ1dWlkX2NvbXBhcmUoKT0lZCBieSBydWxl
ICVkXG4iLCBoZywgcnVsZV9ucik7Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBs
aXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RyYmQtZGV2Cg==
