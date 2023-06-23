Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC273C44B
	for <lists+drbd-dev@lfdr.de>; Sat, 24 Jun 2023 00:55:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 66888420358;
	Sat, 24 Jun 2023 00:55:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 62B3B42017A
	for <drbd-dev@lists.linbit.com>; Sat, 24 Jun 2023 00:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687560949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=WiURs0vKXpYUCqXgawYZgqdOEVHMSUaWINzZV5vrdeY=;
	b=NnzBFSsD21LmvjXJ5eNMokofQtHixWWBtMamiA4tJsRNqta7191Tnpp6cktmkWhsmaLwkQ
	poBJBttsrZVL5cSxaID5VVty9cTCLgracSW1AZlTU19oBe/F5L6VQNj3Xh5TUTD7cUNvwJ
	IYMgPkpWno0rdqNLj5o9aTiGe2PdnPM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
	[66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-195--BFW1w5BP0WNexEK9_ZAZQ-1; Fri, 23 Jun 2023 18:55:46 -0400
X-MC-Unique: -BFW1w5BP0WNexEK9_ZAZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43846810BB2;
	Fri, 23 Jun 2023 22:55:45 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56CA84087C6D;
	Fri, 23 Jun 2023 22:55:43 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 23 Jun 2023 23:55:07 +0100
Message-ID: <20230623225513.2732256-11-dhowells@redhat.com>
In-Reply-To: <20230623225513.2732256-1-dhowells@redhat.com>
References: <20230623225513.2732256-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Subject: [Drbd-dev] [PATCH net-next v5 10/16] drbd: Use
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
Y2tAdmdlci5rZXJuZWwub3JnCmNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCi0tLQoKTm90ZXM6
CiAgICB2ZXIgIzQpCiAgICAgLSBEb24ndCBsb29rIGF0IG1zZy5tc2dfaXRlciBhZnRlciBjYWxs
aW5nIHNlbmRtc2cuICBUaGVyZSdzIG5vIGd1YXJhbnRlZQogICAgICAgaXQgaGFzIGNoYW5nZWQu
CiAgICAKICAgIHZlciAjMikKICAgICAtIFdyYXAgbGluZXMgYXQgODAuCgogZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfbWFpbi5jIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwppbmRleCA4
Mzk4N2U3YTVlZjIuLmVhODJkNjczMzMxMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfbWFpbi5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwpAQCAtMTU0
MCw2ICsxNTQwLDggQEAgc3RhdGljIGludCBfZHJiZF9zZW5kX3BhZ2Uoc3RydWN0IGRyYmRfcGVl
cl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBzdHJ1Y3QgcGFnZSAqcGEKIAkJICAgIGludCBvZmZzZXQs
IHNpemVfdCBzaXplLCB1bnNpZ25lZCBtc2dfZmxhZ3MpCiB7CiAJc3RydWN0IHNvY2tldCAqc29j
a2V0ID0gcGVlcl9kZXZpY2UtPmNvbm5lY3Rpb24tPmRhdGEuc29ja2V0OworCXN0cnVjdCBtc2do
ZHIgbXNnID0geyAubXNnX2ZsYWdzID0gbXNnX2ZsYWdzLCB9OworCXN0cnVjdCBiaW9fdmVjIGJ2
ZWM7CiAJaW50IGxlbiA9IHNpemU7CiAJaW50IGVyciA9IC1FSU87CiAKQEAgLTE1NDksMTUgKzE1
NTEsMTcgQEAgc3RhdGljIGludCBfZHJiZF9zZW5kX3BhZ2Uoc3RydWN0IGRyYmRfcGVlcl9kZXZp
Y2UgKnBlZXJfZGV2aWNlLCBzdHJ1Y3QgcGFnZSAqcGEKIAkgKiBwdXRfcGFnZSgpOyBhbmQgd291
bGQgY2F1c2UgZWl0aGVyIGEgVk1fQlVHIGRpcmVjdGx5LCBvcgogCSAqIF9fcGFnZV9jYWNoZV9y
ZWxlYXNlIGEgcGFnZSB0aGF0IHdvdWxkIGFjdHVhbGx5IHN0aWxsIGJlIHJlZmVyZW5jZWQKIAkg
KiBieSBzb21lb25lLCBsZWFkaW5nIHRvIHNvbWUgb2JzY3VyZSBkZWxheWVkIE9vcHMgc29tZXdo
ZXJlIGVsc2UuICovCi0JaWYgKGRyYmRfZGlzYWJsZV9zZW5kcGFnZSB8fCAhc2VuZHBhZ2Vfb2so
cGFnZSkpCi0JCXJldHVybiBfZHJiZF9ub19zZW5kX3BhZ2UocGVlcl9kZXZpY2UsIHBhZ2UsIG9m
ZnNldCwgc2l6ZSwgbXNnX2ZsYWdzKTsKKwlpZiAoIWRyYmRfZGlzYWJsZV9zZW5kcGFnZSAmJiBz
ZW5kcGFnZV9vayhwYWdlKSkKKwkJbXNnLm1zZ19mbGFncyB8PSBNU0dfTk9TSUdOQUwgfCBNU0df
U1BMSUNFX1BBR0VTOwogCi0JbXNnX2ZsYWdzIHw9IE1TR19OT1NJR05BTDsKIAlkcmJkX3VwZGF0
ZV9jb25nZXN0ZWQocGVlcl9kZXZpY2UtPmNvbm5lY3Rpb24pOwogCWRvIHsKIAkJaW50IHNlbnQ7
CiAKLQkJc2VudCA9IHNvY2tldC0+b3BzLT5zZW5kcGFnZShzb2NrZXQsIHBhZ2UsIG9mZnNldCwg
bGVuLCBtc2dfZmxhZ3MpOworCQlidmVjX3NldF9wYWdlKCZidmVjLCBwYWdlLCBvZmZzZXQsIGxl
bik7CisJCWlvdl9pdGVyX2J2ZWMoJm1zZy5tc2dfaXRlciwgSVRFUl9TT1VSQ0UsICZidmVjLCAx
LCBsZW4pOworCisJCXNlbnQgPSBzb2NrX3NlbmRtc2coc29ja2V0LCAmbXNnKTsKIAkJaWYgKHNl
bnQgPD0gMCkgewogCQkJaWYgKHNlbnQgPT0gLUVBR0FJTikgewogCQkJCWlmICh3ZV9zaG91bGRf
ZHJvcF90aGVfY29ubmVjdGlvbihwZWVyX2RldmljZS0+Y29ubmVjdGlvbiwgc29ja2V0KSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1h
aWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
