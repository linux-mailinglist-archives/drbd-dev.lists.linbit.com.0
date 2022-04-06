Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 646154F698B
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:06:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42F65420FD6;
	Wed,  6 Apr 2022 21:06:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A5CE4205EF
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:05:27 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id i27so6206431ejd.9
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CYx1gEnJeFhX0hcBMvC6AbJqvsenlxSyXFJsv+MoaHE=;
	b=kUkwYXgtmkDRKIJ/rtwUxe+JUh+m7l723YKS7NVAlM4StAuUXqmH8xc+3BCN0MHlEz
	ojUrzjlZiFQQfaOPd7p38msq28KtcXjTX2T0LDE+zuKmbsIV6oiasyOfB92H7rflKIhP
	FtXo2rFXLOuuuqU/qujPVFyIjJfqmql0/7CkgL+Sx+7g2k6kN06saRQS2fvCF0CBeQLL
	BQP4oIlfAOTN069s/oiVibATpiZ6X9l85PUOlK61LmXbnx+vxR3ktqtGotc28uLJOSwH
	U5red2z2ZKWt2Ob2iwMGMDdsUBvYSUwuiPJHwjkIyo9HdpdVIbfguhVU7uGPxqLTKBRh
	yrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CYx1gEnJeFhX0hcBMvC6AbJqvsenlxSyXFJsv+MoaHE=;
	b=as/10VyI1kH6kxG2xeFltUOWGjbRUsM9datnBh6kc6lDuYyp9eMXA5zXs8vb+PFIAd
	6BDIj58/XS40jqbg+1sqFvBXayTUx8t/hUr8ZrwTtMVboRWOKfJYwNDYLPA71h0azJi9
	E6l/L30sUMHZ+X1zFCgFW+uNErRA1vufYOFve4HuLo1siM9uI+yOH8uesSZ7dI6s7enE
	9uYlb9SeJ3CJjmNCLAFjoZyex5CmiP/505s5dKqT5o7a2BWHz9T3s7sl2Nds2TDCI9P1
	+M0k7wDzRlcAlUvcn00h3XYUGy160D+3hlLQPZirADC4EKRcYqfONfW5JW/OV5fgEYCx
	D4kA==
X-Gm-Message-State: AOAM533I2bwNtk2+lc8ib0GfdFii4CyHJelvfSqYoyZWnTVQKRoEiDyH
	4JaEXYU2b1xttxbD96tesTWt89tN
X-Google-Smtp-Source: ABdhPJx2iJvY96w2dmyQ/WbuQP4igjP3LilGuDdSc+3WWSR6MKk809HJ8Ox4pZZZnwIVh0jaGqwoNA==
X-Received: by 2002:a17:907:8a09:b0:6df:f1c6:bfc4 with SMTP id
	sc9-20020a1709078a0900b006dff1c6bfc4mr9926952ejc.550.1649271926937;
	Wed, 06 Apr 2022 12:05:26 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	n27-20020a1709062bdb00b006da975173bfsm6973025ejg.170.2022.04.06.12.05.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:05:26 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:04:44 +0200
Message-Id: <20220406190445.1937206-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
References: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/3] drbd: fix an invalid memory access caused by
	incorrect use of list iterator
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

RnJvbTogWGlhb21lbmcgVG9uZyA8eGlhbTBuZC50b25nQGdtYWlsLmNvbT4KClRoZSBidWcgaXMg
aGVyZToKCWlkcl9yZW1vdmUoJmNvbm5lY3Rpb24tPnBlZXJfZGV2aWNlcywgdm5yKTsKCklmIHRo
ZSBwcmV2aW91cyBmb3JfZWFjaF9jb25uZWN0aW9uKCkgZG9uJ3QgZXhpdCBlYXJseSAobm8gZ290
byBoaXQKaW5zaWRlIHRoZSBsb29wKSwgdGhlIGl0ZXJhdG9yICdjb25uZWN0aW9uJyBhZnRlciB0
aGUgbG9vcCB3aWxsIGJlIGEKYm9ndXMgcG9pbnRlciB0byBhbiBpbnZhbGlkIHN0cnVjdHVyZSBv
YmplY3QgY29udGFpbmluZyB0aGUgSEVBRAooJnJlc291cmNlLT5jb25uZWN0aW9ucykuIEFzIGEg
cmVzdWx0LCB0aGUgdXNlIG9mICdjb25uZWN0aW9uJyBhYm92ZQp3aWxsIGxlYWQgdG8gYSBpbnZh
bGlkIG1lbW9yeSBhY2Nlc3MgKGluY2x1ZGluZyBhIHBvc3NpYmxlIGludmFsaWQgZnJlZQphcyBp
ZHJfcmVtb3ZlIGNvdWxkIGNhbGwgZnJlZV9sYXllcikuCgpUaGUgb3JpZ2luYWwgaW50ZW50aW9u
IHNob3VsZCBoYXZlIGJlZW4gdG8gcmVtb3ZlIGFsbCBwZWVyX2RldmljZXMsCmJ1dCB0aGUgZm9s
bG93aW5nIGxpbmVzIGhhdmUgYWxyZWFkeSBkb25lIHRoZSB3b3JrLiBTbyBqdXN0IHJlbW92ZQp0
aGlzIGxpbmUgYW5kIHRoZSB1bm5lZWRlZCBsYWJlbCwgdG8gZml4IHRoaXMgYnVnLgoKQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IGMwNmVjZTZiYTZmMWIgKCJkcmJkOiBUdXJuIGNv
bm5lY3Rpb24tPnZvbHVtZXMgaW50byBjb25uZWN0aW9uLT5wZWVyX2RldmljZXMiKQpTaWduZWQt
b2ZmLWJ5OiBYaWFvbWVuZyBUb25nIDx4aWFtMG5kLnRvbmdAZ21haWwuY29tPgpSZXZpZXdlZC1i
eTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNv
bT4KUmV2aWV3ZWQtYnk6IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29t
PgotLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyB8IDYgKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21h
aW4uYwppbmRleCA5Njc2YTFkMjE0YmMuLmQ2ZGZhMjg2ZGRiMyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21h
aW4uYwpAQCAtMjc3MywxMiArMjc3MywxMiBAQCBlbnVtIGRyYmRfcmV0X2NvZGUgZHJiZF9jcmVh
dGVfZGV2aWNlKHN0cnVjdCBkcmJkX2NvbmZpZ19jb250ZXh0ICphZG1fY3R4LCB1bnNpZwogCiAJ
aWYgKGluaXRfc3VibWl0dGVyKGRldmljZSkpIHsKIAkJZXJyID0gRVJSX05PTUVNOwotCQlnb3Rv
IG91dF9pZHJfcmVtb3ZlX3ZvbDsKKwkJZ290byBvdXRfaWRyX3JlbW92ZV9mcm9tX3Jlc291cmNl
OwogCX0KIAogCWVyciA9IGFkZF9kaXNrKGRpc2spOwogCWlmIChlcnIpCi0JCWdvdG8gb3V0X2lk
cl9yZW1vdmVfdm9sOworCQlnb3RvIG91dF9pZHJfcmVtb3ZlX2Zyb21fcmVzb3VyY2U7CiAKIAkv
KiBpbmhlcml0IHRoZSBjb25uZWN0aW9uIHN0YXRlICovCiAJZGV2aWNlLT5zdGF0ZS5jb25uID0g
Zmlyc3RfY29ubmVjdGlvbihyZXNvdXJjZSktPmNzdGF0ZTsKQEAgLTI3OTIsOCArMjc5Miw2IEBA
IGVudW0gZHJiZF9yZXRfY29kZSBkcmJkX2NyZWF0ZV9kZXZpY2Uoc3RydWN0IGRyYmRfY29uZmln
X2NvbnRleHQgKmFkbV9jdHgsIHVuc2lnCiAJZHJiZF9kZWJ1Z2ZzX2RldmljZV9hZGQoZGV2aWNl
KTsKIAlyZXR1cm4gTk9fRVJST1I7CiAKLW91dF9pZHJfcmVtb3ZlX3ZvbDoKLQlpZHJfcmVtb3Zl
KCZjb25uZWN0aW9uLT5wZWVyX2RldmljZXMsIHZucik7CiBvdXRfaWRyX3JlbW92ZV9mcm9tX3Jl
c291cmNlOgogCWZvcl9lYWNoX2Nvbm5lY3Rpb24oY29ubmVjdGlvbiwgcmVzb3VyY2UpIHsKIAkJ
cGVlcl9kZXZpY2UgPSBpZHJfcmVtb3ZlKCZjb25uZWN0aW9uLT5wZWVyX2RldmljZXMsIHZucik7
Ci0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBz
Oi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
