Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E07335D7
	for <lists+drbd-dev@lfdr.de>; Fri, 16 Jun 2023 18:20:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1F7634205F5;
	Fri, 16 Jun 2023 18:20:09 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 369 seconds by postgrey-1.31 at mail19;
	Fri, 16 Jun 2023 18:20:07 CEST
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 370A7420358
	for <drbd-dev@lists.linbit.com>; Fri, 16 Jun 2023 18:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686932406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=p9xwt/KxOmKt8o2VLLrb8jjs8WGzx+nDwsNmG750aho=;
	b=QJtAq/0yk2HoXAZGtcA0TUdpMfyaLu474/xQ+u4fnivvaC1uv2vpxsJEGrXE4k2PIMP0Of
	bnRvQALX/m273JySNOSYFvWdNS13kULq+FkJDLBjY8H4y7xGcAsN+c9VB3FYN/B6l/FIKE
	t4EorFycIkTcG5Wjenh9vhzj/LzSnXc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
	[66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-437-eFc4iCLxMeSIHuIkvb1k0A-1; Fri, 16 Jun 2023 12:13:50 -0400
X-MC-Unique: eFc4iCLxMeSIHuIkvb1k0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6958F80120F;
	Fri, 16 Jun 2023 16:13:49 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E1BD40CF8F6;
	Fri, 16 Jun 2023 16:13:46 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 16 Jun 2023 17:12:56 +0100
Message-ID: <20230616161301.622169-14-dhowells@redhat.com>
In-Reply-To: <20230616161301.622169-1-dhowells@redhat.com>
References: <20230616161301.622169-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
	Alexander Duyck <alexander.duyck@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
	Eric Dumazet <edumazet@google.com>, Matthew Wilcox <willy@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH net-next 13/17] drbd: Use
	sendmsg(MSG_SPLICE_PAGES) rather than sendpage()
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

VXNlIHNlbmRtc2coKSBjb25kaXRpb25hbGx5IHdpdGggTVNHX1NQTElDRV9QQUdFUyBpbiBfZHJi
ZF9zZW5kX3BhZ2UoKQpyYXRoZXIgdGhhbiBjYWxsaW5nIHNlbmRwYWdlKCkgb3IgX2RyYmRfbm9f
c2VuZF9wYWdlKCkuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRo
YXQuY29tPgpjYzogUGhpbGlwcCBSZWlzbmVyIDxwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNvbT4K
Y2M6IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29tPgpjYzogIkNocmlz
dG9waCBCw7ZobXdhbGRlciIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgpjYzog
SmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgpjYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVt
QGRhdmVtbG9mdC5uZXQ+CmNjOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+CmNj
OiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpjYzogUGFvbG8gQWJlbmkgPHBhYmVu
aUByZWRoYXQuY29tPgpjYzogZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpjYzogbGludXgtYmxv
Y2tAdmdlci5rZXJuZWwub3JnCmNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIHwgMjMgKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9tYWluLmMKaW5kZXggODM5ODdlN2E1ZWYyLi5jOWQ4NDE4Mzg0NGMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9tYWluLmMKQEAgLTE1NDAsNyArMTU0MCw4IEBAIHN0YXRpYyBpbnQgX2RyYmRfc2VuZF9w
YWdlKHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgc3RydWN0IHBhZ2UgKnBh
CiAJCSAgICBpbnQgb2Zmc2V0LCBzaXplX3Qgc2l6ZSwgdW5zaWduZWQgbXNnX2ZsYWdzKQogewog
CXN0cnVjdCBzb2NrZXQgKnNvY2tldCA9IHBlZXJfZGV2aWNlLT5jb25uZWN0aW9uLT5kYXRhLnNv
Y2tldDsKLQlpbnQgbGVuID0gc2l6ZTsKKwlzdHJ1Y3QgYmlvX3ZlYyBidmVjOworCXN0cnVjdCBt
c2doZHIgbXNnID0geyAubXNnX2ZsYWdzID0gbXNnX2ZsYWdzLCB9OwogCWludCBlcnIgPSAtRUlP
OwogCiAJLyogZS5nLiBYRlMgbWV0YS0gJiBsb2ctZGF0YSBpcyBpbiBzbGFiIHBhZ2VzLCB3aGlj
aCBoYXZlIGEKQEAgLTE1NDksMzMgKzE1NTAsMzMgQEAgc3RhdGljIGludCBfZHJiZF9zZW5kX3Bh
Z2Uoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBzdHJ1Y3QgcGFnZSAqcGEK
IAkgKiBwdXRfcGFnZSgpOyBhbmQgd291bGQgY2F1c2UgZWl0aGVyIGEgVk1fQlVHIGRpcmVjdGx5
LCBvcgogCSAqIF9fcGFnZV9jYWNoZV9yZWxlYXNlIGEgcGFnZSB0aGF0IHdvdWxkIGFjdHVhbGx5
IHN0aWxsIGJlIHJlZmVyZW5jZWQKIAkgKiBieSBzb21lb25lLCBsZWFkaW5nIHRvIHNvbWUgb2Jz
Y3VyZSBkZWxheWVkIE9vcHMgc29tZXdoZXJlIGVsc2UuICovCi0JaWYgKGRyYmRfZGlzYWJsZV9z
ZW5kcGFnZSB8fCAhc2VuZHBhZ2Vfb2socGFnZSkpCi0JCXJldHVybiBfZHJiZF9ub19zZW5kX3Bh
Z2UocGVlcl9kZXZpY2UsIHBhZ2UsIG9mZnNldCwgc2l6ZSwgbXNnX2ZsYWdzKTsKKwlpZiAoIWRy
YmRfZGlzYWJsZV9zZW5kcGFnZSAmJiBzZW5kcGFnZV9vayhwYWdlKSkKKwkJbXNnLm1zZ19mbGFn
cyB8PSBNU0dfTk9TSUdOQUwgfCBNU0dfU1BMSUNFX1BBR0VTOworCisJYnZlY19zZXRfcGFnZSgm
YnZlYywgcGFnZSwgb2Zmc2V0LCBzaXplKTsKKwlpb3ZfaXRlcl9idmVjKCZtc2cubXNnX2l0ZXIs
IElURVJfU09VUkNFLCAmYnZlYywgMSwgc2l6ZSk7CiAKLQltc2dfZmxhZ3MgfD0gTVNHX05PU0lH
TkFMOwogCWRyYmRfdXBkYXRlX2Nvbmdlc3RlZChwZWVyX2RldmljZS0+Y29ubmVjdGlvbik7CiAJ
ZG8gewogCQlpbnQgc2VudDsKIAotCQlzZW50ID0gc29ja2V0LT5vcHMtPnNlbmRwYWdlKHNvY2tl
dCwgcGFnZSwgb2Zmc2V0LCBsZW4sIG1zZ19mbGFncyk7CisJCXNlbnQgPSBzb2NrX3NlbmRtc2co
c29ja2V0LCAmbXNnKTsKIAkJaWYgKHNlbnQgPD0gMCkgewogCQkJaWYgKHNlbnQgPT0gLUVBR0FJ
TikgewogCQkJCWlmICh3ZV9zaG91bGRfZHJvcF90aGVfY29ubmVjdGlvbihwZWVyX2RldmljZS0+
Y29ubmVjdGlvbiwgc29ja2V0KSkKIAkJCQkJYnJlYWs7CiAJCQkJY29udGludWU7CiAJCQl9Ci0J
CQlkcmJkX3dhcm4ocGVlcl9kZXZpY2UtPmRldmljZSwgIiVzOiBzaXplPSVkIGxlbj0lZCBzZW50
PSVkXG4iLAotCQkJICAgICBfX2Z1bmNfXywgKGludClzaXplLCBsZW4sIHNlbnQpOworCQkJZHJi
ZF93YXJuKHBlZXJfZGV2aWNlLT5kZXZpY2UsICIlczogc2l6ZT0lZCBsZW49JXp1IHNlbnQ9JWRc
biIsCisJCQkJICBfX2Z1bmNfXywgKGludClzaXplLCBtc2dfZGF0YV9sZWZ0KCZtc2cpLCBzZW50
KTsKIAkJCWlmIChzZW50IDwgMCkKIAkJCQllcnIgPSBzZW50OwogCQkJYnJlYWs7CiAJCX0KLQkJ
bGVuICAgIC09IHNlbnQ7Ci0JCW9mZnNldCArPSBzZW50OwotCX0gd2hpbGUgKGxlbiA+IDAgLyog
VEhJTksgJiYgZGV2aWNlLT5jc3RhdGUgPj0gQ19DT05ORUNURUQqLyk7CisJfSB3aGlsZSAobXNn
X2RhdGFfbGVmdCgmbXNnKSAvKiBUSElOSyAmJiBkZXZpY2UtPmNzdGF0ZSA+PSBDX0NPTk5FQ1RF
RCovKTsKIAljbGVhcl9iaXQoTkVUX0NPTkdFU1RFRCwgJnBlZXJfZGV2aWNlLT5jb25uZWN0aW9u
LT5mbGFncyk7CiAKLQlpZiAobGVuID09IDApIHsKKwlpZiAoIW1zZ19kYXRhX2xlZnQoJm1zZykp
IHsKIAkJZXJyID0gMDsKIAkJcGVlcl9kZXZpY2UtPmRldmljZS0+c2VuZF9jbnQgKz0gc2l6ZSA+
PiA5OwogCX0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8v
bGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
