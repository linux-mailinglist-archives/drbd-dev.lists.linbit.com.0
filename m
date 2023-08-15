Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCF277DD84
	for <lists+drbd-dev@lfdr.de>; Wed, 16 Aug 2023 11:44:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A38E42066F;
	Wed, 16 Aug 2023 11:44:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 305 seconds by postgrey-1.31 at mail19;
	Tue, 15 Aug 2023 14:56:07 CEST
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B61142018E
	for <drbd-dev@lists.linbit.com>; Tue, 15 Aug 2023 14:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692104166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=y+l55HTddVYwEg/eLFK4VwzVELui+1PXrZDBowROvDQ=;
	b=Hak0HuMIwl8Vftl0T1rag4vm/uIHV8o7FpLc9BebvKiocQdLwoz8GuLSiVa04TlDpuK/HS
	f3387CMosSmdQ1RbfSsInYdYB7medp0X6IeAkI3MgjWYkCoiO67e+FruNbvazwl86mLkFx
	LpcO+XyzD//fsGbhNM4B3JL3aWl1ens=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-622-ll15gl-GO-y5SNsQYGgXKQ-1; Tue, 15 Aug 2023 08:49:11 -0400
X-MC-Unique: ll15gl-GO-y5SNsQYGgXKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D42F1C07588;
	Tue, 15 Aug 2023 12:49:10 +0000 (UTC)
Received: from RHTPC1VM0NT (unknown [10.22.9.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19F70C15BAD;
	Tue, 15 Aug 2023 12:49:09 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20230814214723.2924989-1-kuba@kernel.org>
	<20230814214723.2924989-4-kuba@kernel.org>
Date: Tue, 15 Aug 2023 08:49:08 -0400
In-Reply-To: <20230814214723.2924989-4-kuba@kernel.org> (Jakub Kicinski's
	message of "Mon, 14 Aug 2023 14:47:16 -0700")
Message-ID: <f7twmxwxygr.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Wed, 16 Aug 2023 11:44:06 +0200
Cc: axboe@kernel.dk, dev@openvswitch.org, jiri@resnulli.us,
	netdev@vger.kernel.org, jacob.e.keller@intel.com,
	philipp.reisner@linbit.com, jmaloy@redhat.com,
	linux-block@vger.kernel.org, edumazet@google.com,
	tipc-discussion@lists.sourceforge.net, lars.ellenberg@linbit.com,
	Jiri Pirko <jiri@nvidia.com>, ying.xue@windriver.com,
	johannes@sipsolutions.net, pabeni@redhat.com,
	davem@davemloft.net, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [ovs-dev] [PATCH net-next v3 03/10] genetlink:
 remove userhdr from struct genl_info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Jakub Kicinski <kuba@kernel.org> writes:

> Only three families use info->userhdr today and going forward
> we discourage using fixed headers in new families.
> So having the pointer to user header in struct genl_info
> is an overkill. Compute the header pointer at runtime.
>
> Reviewed-by: Johannes Berg <johannes@sipsolutions.net>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Seems the OVS side didn't change from v2 so still:

Reviewed-by: Aaron Conole <aconole@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
