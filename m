Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3616A82F2
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Mar 2023 13:57:56 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B866342210F;
	Thu,  2 Mar 2023 13:57:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 13CFE421742
	for <drbd-dev@lists.linbit.com>; Thu,  2 Mar 2023 13:55:30 +0100 (CET)
Received: by mail-ed1-f47.google.com with SMTP id f13so67177662edz.6
	for <drbd-dev@lists.linbit.com>; Thu, 02 Mar 2023 04:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1677761730;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=1kxDLEHqeSUzC07bB1oJ0MhsEczzoLXd9EtZFkAmxP8=;
	b=VsQz9FhdRKRUmHZD9G4GNRJ454L7tKxaTS345k7aLCTJeR+OHIfOvpLCuA5wndRXlC
	82gkRGUj4ue7MyzthafS9UNIdwK67PDkzgOzVxHEt61mqB/o3NQ1iMVBL/WO8TtYDNQ3
	H3a0UNzaJB/wFAVc8oZ9YrdQyclihBoBAHrG84vDbmO/Lren53oZB6ry6cnosf4kuluN
	eGhi2ThiEJmCiClCbNyyUUM+1HyoPiWEO9ZkTzA/AA+xkDEtsW+h0OO4vXiCP8OWvl9b
	SSfN3UwdSzg6qL1af6CzPCgx1C0GUe9Z9J2jGME76Thl9G8izfhtspgH2aUN3tg0uCuB
	7mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1677761730;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=1kxDLEHqeSUzC07bB1oJ0MhsEczzoLXd9EtZFkAmxP8=;
	b=4px2CiKYOTZpYKvlTSvSC7XEV/Dd3Mpfwdl5n9sEIJq6HdC8Gtv1EY++RHaRkU3Mg/
	A30wUF+sUDPd4SLh0Di9noV/NbN8C3hKyv6FpXFy3vnTx8MhCpSl2UZ6dnBgKq2NuVkl
	nT4udLBG2BcPW40YoqhvoxCFPNJkXYAiDUFP8MKunHu+dMgtx5+9NotXHFVARYMpJ4hQ
	JfOlEapdkjxH6P0ohr+PIB+tChCaZfDEazQqZVi076JRHLUgxZWPcJs9xvgWyCxGIhsy
	MRao7oQQLnC4wMTDpgJlYvicWAvAqR/0tmgdzOeDU3Nh89yqNektrx2JFrnBAIJkC1FO
	d0IA==
X-Gm-Message-State: AO0yUKVv46Dz44OlNqwFMcKI4dxKT5TD9hd5Q2ddLj99ZUBoQaVH3joh
	7iHgWYpFzpAyIwEdelbTHynvc9Pe
X-Google-Smtp-Source: AK7set+pHZNmbblwwxa6IeoJky8Rxxwh3CnNVwCpC5M7ssBOdrx2CR7rlC0zNSJRJ81lbS2YCpJs/A==
X-Received: by 2002:aa7:c91a:0:b0:4af:5aa1:6e58 with SMTP id
	b26-20020aa7c91a000000b004af5aa16e58mr11277992edt.21.1677761730423;
	Thu, 02 Mar 2023 04:55:30 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	a98-20020a509eeb000000b004ad601533a3sm6955034edf.55.2023.03.02.04.55.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Mar 2023 04:55:30 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  2 Mar 2023 13:54:43 +0100
Message-Id: <20230302125445.2653493-6-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302125445.2653493-1-christoph.boehmwalder@linbit.com>
References: <20230302125445.2653493-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 5/7] drbd: drbd_uuid_compare: pass a
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
ICVkXG4iLCBoZywgcnVsZV9ucik7Ci0tIAoyLjM5LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBs
aXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RyYmQtZGV2Cg==
