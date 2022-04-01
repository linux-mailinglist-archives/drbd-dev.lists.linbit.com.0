Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2FF4EFD4F
	for <lists+drbd-dev@lfdr.de>; Sat,  2 Apr 2022 01:56:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B7C0C42015D;
	Sat,  2 Apr 2022 01:56:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9352D42011D
	for <drbd-dev@lists.linbit.com>; Sat,  2 Apr 2022 01:56:44 +0200 (CEST)
Received: by mail-pf1-f180.google.com with SMTP id w7so3968164pfu.11
	for <drbd-dev@lists.linbit.com>; Fri, 01 Apr 2022 16:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=VQ+/LXmZBpLsFWJ/iYBd7+wR3oEOq8NpUsezc2JIIDw=;
	b=nELgAlV6Vv2GxUEc8WOyDjluNtKh3pCKw9l+sXlrNhWtxWpRQnlCpoYKbdUTvQH9Lr
	AuOGkrI3yUsyH7dvAa75ZRAev2JfkpPm1AnVB+MJ3PvPXUybjOcbCeH7YjOe8d3fKjHQ
	bvgiZgtaVO9eMdk3nIcXnBh1XDU5Od2gdyP1m31xyY66hXq2Cf0CpRUV16BBIXoe/4xx
	TIWAKclzDrq6q8CQdHnv/ByYsF345EJzjT/NIkwH0KD8db33UVuSj8wLjArH1pImZDNB
	VhbvEsbNvko4CbsDZOkBEB6aK9jODfJvr/eQx1DfdZ2R4CctWHceZhMi2SZvHwitnn9X
	AwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=VQ+/LXmZBpLsFWJ/iYBd7+wR3oEOq8NpUsezc2JIIDw=;
	b=zEJxViWmPJZ8FwRzMhIOduP1GPXRYrHO0fttAD6uxWagN1XkpGnQ5o5lOpUiElG6bp
	801k29QTZivHZe1wq+5+ZZ1s+GZh8N8AnTLA4etyCQ5O3QN9SG5OBj0U5TTuvz68FQRc
	JCZSFfU5Ha1dpp+euiFE+SYL7Rg+NT6HdYNVv6n2s4Bdgqo2W0QpxZNMoS1eE5mBEoOk
	8YhMYdK3u/yTN/ayFhxUJvSvYJRyZXFKA0pmVz9ZDPsejXd4ecijRInxwaYIXlV3sp0Z
	Xzn3OAM7Z5Mi87/PSjus5aFbG2KNgAybyamLLKjZ7sYvO84CzmmVU8UpTlZDjcufTMbM
	3Kxg==
X-Gm-Message-State: AOAM530AXLO/12ZouW/QZFxNQETVzp2w5MbQfL4rkldt/sN87FAPRD17
	d+XLBucw4fMG6Rh9levKP5ZCGg==
X-Google-Smtp-Source: ABdhPJyjW8TjDgz0OTj7QB9ER5R991hyLy8Kyoztyj4/dY+4JL34juigk8KO2prtyD4tQpPRf+hD/g==
X-Received: by 2002:a05:6a00:234f:b0:4f6:f0c0:ec68 with SMTP id
	j15-20020a056a00234f00b004f6f0c0ec68mr13549033pfj.14.1648857403369;
	Fri, 01 Apr 2022 16:56:43 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	v189-20020a622fc6000000b004fb72e95806sm4044187pfv.48.2022.04.01.16.56.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Apr 2022 16:56:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220331220349.885126-1-jakobkoschel@gmail.com>
References: <20220331220349.885126-1-jakobkoschel@gmail.com>
Message-Id: <164885740219.761778.5044909883791536138.b4-ty@kernel.dk>
Date: Fri, 01 Apr 2022 17:56:42 -0600
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	linux-block@vger.kernel.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Mike Rapoport <rppt@kernel.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 1/2] drbd: remove usage of list iterator
	variable after loop for list_for_each_entry_safe_from()
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

On Fri, 1 Apr 2022 00:03:48 +0200, Jakob Koschel wrote:
> In preparation to limit the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to iterate through the list [1].
> 
> Since that variable should not be used past the loop iteration, a
> separate variable is used to 'remember the current location within the
> loop'.
> 
> [...]

Applied, thanks!

[1/2] drbd: remove usage of list iterator variable after loop for list_for_each_entry_safe_from()
      commit: 901aeda62efa21f2eae937bccb71b49ae531be06
[2/2] drbd: remove check of list iterator against head past the loop body
      commit: 2651ee5ae43241831ca63d7158bb2b151a6a0e1f

Best regards,
-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
