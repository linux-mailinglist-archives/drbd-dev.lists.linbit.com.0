Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CE7A2AD5
	for <lists+drbd-dev@lfdr.de>; Sat, 16 Sep 2023 01:03:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 95F6F4267EF;
	Sat, 16 Sep 2023 01:03:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 10DDA425C97
	for <drbd-dev@lists.linbit.com>; Sat, 16 Sep 2023 01:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=kAhu3RhQYAb+8x8i6cEfQIaFhfRyBt/UYtL6yvE2uiU=;
	b=ipX40f4//V/ZCGGZ4czyigk+tq
	Y1pEa4+9a0xgZHI9HB4D4Tfrictfi7SMy0XGAfRV739gQESHHurrBTlm5Ua+EE3iZV0tsx6IKqvwZ
	IiC6jCE6msF7T92DFE/znIds6/zZgcrifjXuvn0EcmNskZ6gPaGreeyH5rJC6lgqaAeL6P7rfVtkG
	DMPIuRQ+bZaIIBLKq7iwAyTitwD25b+3/vJUJ6ZlqhptkqgEUnJsMCFqyWqs7kD/j4JUp8wQpiPG0
	Ac3VauQPjIuDinZl/qGvSMQdchK2QEx+UkGmAc0m6gGcpDATkelTsHLTVh8nggDwFVZd4JhiP4A92
	z2qI6tpQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1qhHXM-00BUtM-2g; Fri, 15 Sep 2023 22:43:44 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 15 Sep 2023 15:43:40 -0700
Message-Id: <20230915224343.2740317-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230915224343.2740317-1-mcgrof@kernel.org>
References: <20230915224343.2740317-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, rohan.puri@samsung.com,
	da.gomez@samsung.com, mcgrof@kernel.org, patches@lists.linux.dev,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, hare@suse.de,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, rpuri.linux@gmail.com,
	kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v3 1/4] drbd: use PAGE_SECTORS_SHIFT and
	PAGE_SECTORS
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

UmVwbGFjZSBjb21tb24gY29uc3RhbnRzIHdpdGggZ2VuZXJpYyB2ZXJzaW9ucy4KVGhpcyBwcm9k
dWNlcyBubyBmdW5jdGlvbmFsIGNoYW5nZXMuCgpBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2Fs
ZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KUmV2aWV3ZWQtYnk6IEpvaGFu
bmVzIFRodW1zaGlybiA8am9oYW5uZXMudGh1bXNoaXJuQHdkYy5jb20+ClNpZ25lZC1vZmYtYnk6
IEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX2JpdG1hcC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X2JpdG1hcC5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0bWFwLmMKaW5kZXggODVjYTAw
MGEwNTY0Li4xYTE3ODJmNTVlNjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X2JpdG1hcC5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2JpdG1hcC5jCkBAIC0xMDAw
LDcgKzEwMDAsNyBAQCBzdGF0aWMgdm9pZCBibV9wYWdlX2lvX2FzeW5jKHN0cnVjdCBkcmJkX2Jt
X2Fpb19jdHggKmN0eCwgaW50IHBhZ2VfbnIpIF9fbXVzdF9obwogCXVuc2lnbmVkIGludCBsZW47
CiAKIAlmaXJzdF9ibV9zZWN0ID0gZGV2aWNlLT5sZGV2LT5tZC5tZF9vZmZzZXQgKyBkZXZpY2Ut
PmxkZXYtPm1kLmJtX29mZnNldDsKLQlvbl9kaXNrX3NlY3RvciA9IGZpcnN0X2JtX3NlY3QgKyAo
KChzZWN0b3JfdClwYWdlX25yKSA8PCAoUEFHRV9TSElGVC1TRUNUT1JfU0hJRlQpKTsKKwlvbl9k
aXNrX3NlY3RvciA9IGZpcnN0X2JtX3NlY3QgKyAoKChzZWN0b3JfdClwYWdlX25yKSA8PCBQQUdF
X1NFQ1RPUlNfU0hJRlQpOwogCiAJLyogdGhpcyBtaWdodCBoYXBwZW4gd2l0aCB2ZXJ5IHNtYWxs
CiAJICogZmxleGlibGUgZXh0ZXJuYWwgbWV0YSBkYXRhIGRldmljZSwKQEAgLTEwMDgsNyArMTAw
OCw3IEBAIHN0YXRpYyB2b2lkIGJtX3BhZ2VfaW9fYXN5bmMoc3RydWN0IGRyYmRfYm1fYWlvX2N0
eCAqY3R4LCBpbnQgcGFnZV9ucikgX19tdXN0X2hvCiAJbGFzdF9ibV9zZWN0ID0gZHJiZF9tZF9s
YXN0X2JpdG1hcF9zZWN0b3IoZGV2aWNlLT5sZGV2KTsKIAlpZiAoZmlyc3RfYm1fc2VjdCA8PSBv
bl9kaXNrX3NlY3RvciAmJiBsYXN0X2JtX3NlY3QgPj0gb25fZGlza19zZWN0b3IpIHsKIAkJc2Vj
dG9yX3QgbGVuX3NlY3QgPSBsYXN0X2JtX3NlY3QgLSBvbl9kaXNrX3NlY3RvciArIDE7Ci0JCWlm
IChsZW5fc2VjdCA8IFBBR0VfU0laRS9TRUNUT1JfU0laRSkKKwkJaWYgKGxlbl9zZWN0IDwgUEFH
RV9TRUNUT1JTKQogCQkJbGVuID0gKHVuc2lnbmVkIGludClsZW5fc2VjdCpTRUNUT1JfU0laRTsK
IAkJZWxzZQogCQkJbGVuID0gUEFHRV9TSVpFOwotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJi
ZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kcmJkLWRldgo=
